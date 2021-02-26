import 'package:another_flushbar/flushbar_helper.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:kt_dart/collection.dart';
import 'package:provider/provider.dart';
import 'package:to_do/application/notes/note_form/note_form_bloc.dart';
import 'package:to_do/domain/notes/value_objects.dart';
import 'package:to_do/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:to_do/shared/color_constants.dart';
import 'package:to_do/shared/sizeconfig.dart';
import 'package:to_do/presentation/notes/note_form/misc/build_context_x.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (previousState, currentState) =>
          previousState.note.todo.isFull != currentState.note.todo.isFull,
      listener: (context, state) {
        if (state.note.todo.isFull) {
          FlushbarHelper.createAction(
            message: 'Want more to-dos? Activate premium. 🤩',
            button: FlatButton(
              onPressed: () {},
              child: null,
              // child: Text(
              //   'BUY NOW',
              //   style: GoogleFonts.quicksand(
              //     color: Colors.yellow,
              //   ),
              // ),
            ),
            duration: const Duration(seconds: 5),
          ).show(context);
        }
      },
      child: Consumer<FormTodo>(
        builder: (context, formTodo, child) {
          return ImplicitlyAnimatedReorderableList<TodoItemPrimitive>(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0.0),
            shrinkWrap: true,
            // ignore: avoid_redundant_argument_values
            removeDuration: const Duration(milliseconds: 0),
            items: formTodo.value.asList(),
            areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
            onReorderFinished: (item, from, to, newItems) {
              context.formTodo = newItems.toImmutableList();
              context
                  .read<NoteFormBloc>()
                  .add(NoteFormEvent.todoChanged(context.formTodo));
            },
            itemBuilder: (context, itemAnimation, item, index) {
              return Reorderable(
                key: ValueKey(item.id),
                builder: (context, dragAnimation, inDrag) {
                  return TodoTile(
                    index: index,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;
  const TodoTile({
    @required this.index,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = context.formTodo.getOrElse(
      index,
      (_) => TodoItemPrimitive.empty(),
    );
    final textEditingController = useTextEditingController(text: todo.name);

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      secondaryActions: [
        IconSlideAction(
          icon: SimpleLineIcons.minus,
          // icon: IonIcons.ios_remove_circle_outline,
          color: Colors.red,
          onTap: () {
            context.formTodo = context.formTodo.minusElement(todo);
            context
                .read<NoteFormBloc>()
                .add(NoteFormEvent.todoChanged(context.formTodo));
          },
        )
      ],
      child: Material(
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(
            vertical: SizeConfig.safeBlockVertical * 5,
            horizontal: SizeConfig.safeBlockHorizontal * 5,
          ),
          child: ListTile(
            leading: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 15,
              ),
              child: Container(
                height: SizeConfig.safeBlockVertical * 30,
                width: SizeConfig.safeBlockVertical * 30,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                    shape: BoxShape.circle),
                child: CircularCheckBox(
                  activeColor: kCheckMarkColor,
                  value: todo.done,
                  onChanged: (value) {
                    context.formTodo = context.formTodo.map(
                      (listTodo) => listTodo == todo
                          ? todo.copyWith(done: value)
                          : listTodo,
                    );
                    context
                        .read<NoteFormBloc>()
                        .add(NoteFormEvent.todoChanged(context.formTodo));
                  },
                ),
              ),
            ),
            trailing: const Handle(
                child: Icon(
              FeatherIcons.list,
            )),
            title: TextFormField(
              controller: textEditingController,
              decoration: const InputDecoration(
                counterText: '',
                hintText: 'ToDo',
                border: InputBorder.none,
              ),
              maxLength: TodoName.maxLength,
              onChanged: (value) {
                context.formTodo = context.formTodo.map(
                  (listTodo) =>
                      listTodo == todo ? todo.copyWith(name: value) : listTodo,
                );
                context
                    .read<NoteFormBloc>()
                    .add(NoteFormEvent.todoChanged(context.formTodo));
              },
              validator: (_) {
                return context.read<NoteFormBloc>().state.note.todo.value.fold(
                      (f) => null,
                      (todoList) => todoList[index].name.value.fold(
                            (f) => f.maybeMap(
                              empty: (_) => 'Cannot be empty',
                              exceedingLength: (_) => 'Too long',
                              multiLine: (_) => 'Has to be in a single line',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                    );
              },
            ),
          ),
        ),
      ),
    );
  }
}
