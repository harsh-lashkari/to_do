import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/application/notes/note_form/note_form_bloc.dart';
import 'package:to_do/domain/notes/value_objects.dart';
import 'package:to_do/presentation/core/widgets/ensure_visibility.dart';
import 'package:to_do/shared/sizeconfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyField extends StatefulWidget {
  const BodyField({
    Key key,
  }) : super(key: key);

  @override
  _BodyFieldState createState() => _BodyFieldState();
}

class _BodyFieldState extends State<BodyField> {
  final FocusNode focusNode = FocusNode();
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController noteEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (previousState, currentState) =>
          previousState.isEditing != currentState.isEditing,
      listener: (context, state) {
        titleEditingController.text = state.note.title.getOrCrash();
        noteEditingController.text = state.note.body.getOrCrash();
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
                controller: titleEditingController,
                decoration: InputDecoration(
                  // floatingLabelBehavior: FloatingLabelBehavior.never,
                  // enabledBorder: InputBorder.none,
                  // disabledBorder: InputBorder.none,
                  // border: InputBorder.none,
                  // focusedBorder: InputBorder.none,
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
              controller: noteEditingController,
              decoration: InputDecoration(
                // prefix: const Text(
                //   'Note:',
                // ),
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
          ],
        ),
      ),
    );
  }
}
