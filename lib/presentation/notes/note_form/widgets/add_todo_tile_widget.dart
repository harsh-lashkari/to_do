import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kt_dart/collection.dart';
import 'package:to_do/application/notes/note_form/note_form_bloc.dart';
import 'package:to_do/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:to_do/shared/sizeconfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/presentation/notes/note_form/misc/build_context_x.dart';
// import 'package:provider/provider.dart';

class AddTodoTile extends StatelessWidget {
  const AddTodoTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteFormBloc, NoteFormState>(
      listenWhen: (previousState, currentState) =>
          previousState.isEditing != currentState.isEditing,
      listener: (context, state) {
        context.formTodo = state.note.todo.value.fold(
          (f) => listOf<TodoItemPrimitive>(),
          (todoItemList) => todoItemList.map(
            (_) => TodoItemPrimitive.fromDomain(_),
          ),
        );
      },
      buildWhen: (previousState, currentState) =>
          previousState.note.todo.isFull != currentState.note.todo.isFull,
      builder: (context, state) {
        return ListTile(
          enabled: !state.note.todo.isFull,
          title: Text(
            'Add a todo',
            style: GoogleFonts.roboto(
              fontSize: 18,
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.safeBlockVertical * 10,
              bottom: SizeConfig.safeBlockVertical * 10,
              left: SizeConfig.safeBlockHorizontal * 10,
            ),
            child: const Icon(
              FeatherIcons.plus,
              size: 25,
            ),
          ),
          onTap: () {
            context.formTodo =
                context.formTodo.plusElement(TodoItemPrimitive.empty());
            context.read<NoteFormBloc>().add(
                  NoteFormEvent.todoChanged(context.formTodo),
                );
          },
        );
      },
    );
  }
}
