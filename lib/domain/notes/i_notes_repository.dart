import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:to_do/domain/notes/note_failure.dart';
import 'package:to_do/domain/notes/notes.dart';

abstract class INoteRepository {
  // watch notes
  // watch incomplete motes

  Stream<Either<NoteFailure, KtList<Note>>> watchAll();
  Stream<Either<NoteFailure, KtList<Note>>> watchIncomplete();
  
  Future<Either<NoteFailure, Unit>> create();
  Future<Either<NoteFailure, Unit>> update();
  Future<Either<NoteFailure, Unit>> delete();
}
