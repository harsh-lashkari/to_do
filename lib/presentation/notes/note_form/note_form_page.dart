import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do/application/notes/note_form/note_form_bloc.dart';
import 'package:to_do/domain/notes/note.dart';
import 'package:to_do/injection.dart';
import 'package:to_do/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:to_do/presentation/notes/note_form/widgets/add_todo_tile_widget.dart';
import 'package:to_do/presentation/notes/note_form/widgets/body_field_widget.dart';
import 'package:to_do/presentation/notes/note_form/widgets/color_field_widget.dart';
import 'package:to_do/presentation/notes/note_overview/widgets/todo_list_widget.dart';
import 'package:to_do/presentation/routes/router.gr.dart';
import 'package:to_do/shared/sizeconfig.dart';

class NoteFormPage extends StatelessWidget {
  final Note editedNote;

  const NoteFormPage({
    Key key,
    @required this.editedNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NoteFormBloc>()
        ..add(
          NoteFormEvent.initialized(
            optionOf(editedNote),
          ),
        ),
      child: BlocConsumer<NoteFormBloc, NoteFormState>(
          listenWhen: (previousState, currentState) =>
              previousState.saveFailureOrSuccessOption !=
              currentState.saveFailureOrSuccessOption,
          listener: (context, state) {
            state.saveFailureOrSuccessOption.fold(() => null, (either) {
              either.fold(
                (failure) {
                  FlushbarHelper.createError(
                    message: failure.map(
                      unexpected: (_) => 'Unexpected Error',
                      insufficientPermission: (_) => 'Insufficient Permissions',
                      unableToUpdate: (_) => 'Unable To Update',
                    ),
                  ).show(context);
                },
                (_) {
                  ExtendedNavigator.of(context).popUntil(
                    (route) => route.settings.name == Routes.noteOverviewPage,
                  );
                },
              );
            });
          },
          buildWhen: (previousState, currentState) =>
              previousState.isSaving != currentState.isSaving,
          builder: (context, state) {
            return Stack(
              children: [
                const NoteFormPageScaffold(),
                SavingInProgressOverlay(
                  isSaving: state.isSaving,
                ),
              ],
            );
          }),
    );
  }
}

class SavingInProgressOverlay extends StatelessWidget {
  final bool isSaving;
  const SavingInProgressOverlay({
    Key key,
    @required this.isSaving,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        color: isSaving ? Colors.black.withOpacity(0.5) : Colors.transparent,
        child: Visibility(
          visible: isSaving,
          child: SpinKitFadingCube(
            color: Colors.white,
            size: SizeConfig.safeBlockHorizontal * 25,
          ),
        ),
      ),
    );
  }
}

class NoteFormPageScaffold extends StatelessWidget {
  const NoteFormPageScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            SizeConfig.safeBlockVertical * 75,
          ),
          child: BlocBuilder<NoteFormBloc, NoteFormState>(
            buildWhen: (p, c) => p.note.color != c.note.color,
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  color: state.note.color.getOrCrash(),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(5),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppBar(
                      // backgroundColor: Colors.blue,
                      title: BlocBuilder<NoteFormBloc, NoteFormState>(
                          buildWhen: (previousState, currentState) =>
                              previousState.isEditing != currentState.isEditing,
                          builder: (context, state) {
                            return Text(
                              state.isEditing ? 'Edit note' : 'Add a new note',
                              style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: SizeConfig.safeBlockHorizontal * 20,
                          ),
                          child: IconButton(
                            onPressed: () {
                              context.read<NoteFormBloc>().add(
                                    const NoteFormEvent.saved(),
                                  );
                              // BodyFieldState().sendAndUpdate();
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(
                              FeatherIcons.save,
                              size: 25,
                              // color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        body: BlocBuilder<NoteFormBloc, NoteFormState>(
          buildWhen: (previousState, currentState) =>
              previousState.showErrorMessages != currentState.showErrorMessages,
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => FormTodo(),
              child: Form(
                // ignore: deprecated_member_use
                autovalidate: state.showErrorMessages,
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                    // physics: const NeverScrollableScrollPhysics(),
                    // physics: const BouncingScrollPhysics(),
                    // reverse: true,

                    child: Padding(
                      padding: EdgeInsets.only(bottom: bottom),
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 25,
                          ),
                          const BodyField(),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 20,
                          ),
                          const TodoList(),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 10,
                          ),
                          const AddTodoTile(),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(
              child: BottomAppBar(
                elevation: 0,
                child: ColorField(),
              ),
            ),
          ],
        ),
        extendBody: true,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
