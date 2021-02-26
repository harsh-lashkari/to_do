import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:to_do/domain/core/failures.dart';
import 'package:to_do/domain/core/value_objects.dart';
import 'package:to_do/domain/notes/todo_item.dart';
import 'package:to_do/domain/notes/value_objects.dart';

part 'note.freezed.dart';

@freezed
abstract class Note implements _$Note {
  const Note._();

  const factory Note({
    @required UniqueId id,
    @required NoteTitle title,
    @required NoteBody body,
    @required NoteColor color,
    @required List3<TodoItem> todo,
  }) = _Note;

  factory Note.empty() => Note(
        id: UniqueId(),
        title: NoteTitle(''),
        body: NoteBody(''),
        color: NoteColor(NoteColor.predefinedColors[0]),
        todo: List3(emptyList()),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return title.failureOrUnit
        .andThen(body.failureOrUnit)
        .andThen(todo.failureOrUnit)
        .andThen(
          todo
              .getOrCrash()
              .map((todoItem) => todoItem.failureOption)
              .filter((o) => o.isSome())
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), (f) => left(f)),
        )
        .fold(
          (f) => some(f),
          (_) => none(),
        );
  }
}
