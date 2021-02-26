import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:to_do/domain/notes/note_failure.dart';
import 'package:to_do/domain/notes/note.dart';

abstract class INoteRepository {
  // watch notes
  // watch incomplete motes

  Stream<Either<NoteFailure, KtList<Note>>> watchAll();
  Stream<Either<NoteFailure, KtList<Note>>> watchIncomplete();
  Stream<Either<NoteFailure, KtList<Note>>> search(String str);

  Future<Either<NoteFailure, Unit>> create(Note note);
  Future<Either<NoteFailure, Unit>> update(Note note);
  Future<Either<NoteFailure, Unit>> delete(Note note);
}
