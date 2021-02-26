import 'package:flutter/widgets.dart';
import 'package:kt_dart/collection.dart';
import 'package:provider/provider.dart';
import 'package:to_do/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

extension FormTodoX on BuildContext {
  KtList<TodoItemPrimitive> get formTodo =>
      Provider.of<FormTodo>(this, listen: false).value;
      set formTodo(KtList<TodoItemPrimitive> value) => 
      Provider.of<FormTodo>(this, listen: false).value = value;
}
