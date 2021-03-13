import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_widget/home_widget.dart';
import 'package:to_do/application/notes/note_form/note_form_bloc.dart';
import 'package:to_do/domain/notes/value_objects.dart';
import 'package:to_do/presentation/core/widgets/ensure_visibility.dart';
import 'package:to_do/shared/sizeconfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/shared/text_style_constants.dart';

class BodyField extends StatefulWidget {
  const BodyField({
    Key key,
  }) : super(key: key);

  @override
  BodyFieldState createState() => BodyFieldState();
}

class BodyFieldState extends State<BodyField> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {});
    HomeWidget.setAppGroupId('NOTE_WIDGET');
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  Future<void> sendData() async {
    try {
      return Future.wait([
        HomeWidget.saveWidgetData<String>('title', titleController.text),
        HomeWidget.saveWidgetData<String>('message', noteController.text),
      ]);
    } on PlatformException catch (exception) {
      debugPrint('Error Sending Data. $exception');
    }
  }

  Future<void> updateWidget() async {
    try {
      return HomeWidget.updateWidget(
          name: 'NotesWidgetProvider', iOSName: 'NotesWidget');
    } on PlatformException catch (exception) {
      debugPrint('Error Updating Widget. $exception');
    }
  }

  Future<void> loadData() async {
    try {
      return Future.wait([
        HomeWidget.getWidgetData<String>('title', defaultValue: 'Default Title')
            .then((value) => titleController.text = value),
        HomeWidget.getWidgetData<String>('message',
                defaultValue: 'Default Message')
            .then((value) => noteController.text = value),
      ]);
    } on PlatformException catch (exception) {
      debugPrint('Error Getting Data. $exception');
    }
  }

  Future<void> sendAndUpdate() async {
    await sendData();
    await updateWidget();
    await loadData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (previousState, currentState) =>
          previousState.isEditing != currentState.isEditing,
      listener: (context, state) {
        titleController.text = state.note.title.getOrCrash();
        noteController.text = state.note.body.getOrCrash();
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.safeBlockHorizontal * 25,
          right: SizeConfig.safeBlockHorizontal * 25,
        ),
        child: Column(
          children: [
            EnsureVisibleWhenFocused(
              focusNode: focusNode,
              child: TextFormField(
                style: GoogleFonts.roboto(
                  fontSize: SizeConfig.safeBlockVertical * 18,
                ),
                controller: titleController,
                decoration: InputDecoration(
                  counterText: '',
                  labelText: 'Title',
                  labelStyle: GoogleFonts.roboto(
                    fontSize: SizeConfig.safeBlockVertical * 20,
                  ),
                ),
                onChanged: (value) => context.read<NoteFormBloc>().add(
                      NoteFormEvent.titleChanged(value),
                    ),
                maxLength: NoteTitle.maxLength,
                validator: (_) =>
                    context.read<NoteFormBloc>().state.note.title.value.fold(
                          (f) => f.maybeMap(
                            empty: (f) => 'Cannot be empty.',
                            exceedingLength: (f) =>
                                'Exceeding length. MAX = ${f.max}',
                            orElse: () => null,
                          ),
                          (r) => null,
                        ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 20,
            ),
            TextFormField(
              scrollPhysics: const BouncingScrollPhysics(),
              controller: noteController,
              decoration: InputDecoration(
                counterText: '',
                labelStyle: GoogleFonts.roboto(),
              ),
              maxLength: NoteBody.maxLength,
              maxLines: 10,
              minLines: 10,
              onChanged: (value) => context.read<NoteFormBloc>().add(
                    NoteFormEvent.bodyChanged(value),
                  ),
              validator: (_) =>
                  context.read<NoteFormBloc>().state.note.body.value.fold(
                        (f) => f.maybeMap(
                          empty: (f) => 'Cannot be empty.',
                          exceedingLength: (f) =>
                              'Exceeding length. MAX = ${f.max}',
                          orElse: () => null,
                        ),
                        (r) => null,
                      ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 30,
            ),
            GestureDetector(
              onTap: () {
                sendAndUpdate();
                showInSnackBar(
                  'SAVED TO WIDGET',
                );
                context.read<NoteFormBloc>().add(
                      const NoteFormEvent.saved(),
                    );
              },
              child: Container(
                height: SizeConfig.safeBlockVertical * 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "SAVE NOTE TO WIDGET",
                    style: GoogleFonts.quicksand(
                      textStyle: kButtonTextStyle,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showInSnackBar(String value) {
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(value),
      ),
    );
  }
}
