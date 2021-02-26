import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:to_do/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:to_do/shared/sizeconfig.dart';
import 'package:to_do/presentation/notes/note_overview/widgets/note_card_widget.dart';
import 'package:to_do/presentation/notes/note_overview/widgets/error_note_card_widget.dart';
import 'package:to_do/presentation/notes/note_overview/widgets/critical_failure_widget.dart';

class NotesOverviewBody extends StatelessWidget {
  const NotesOverviewBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => Center(
            child: SizedBox(
              height: SizeConfig.safeBlockVertical * 450,
              child: SpinKitFadingCube(
                color: Colors.black,
                size: SizeConfig.safeBlockHorizontal * 25,
              ),
            ),
          ),
          loadSuccess: (state) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.notes.size,
              itemBuilder: (context, index) {
                final note = state.notes[index];
                if (note.failureOption.isSome()) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.safeBlockVertical * 15,
                    ),
                    child: ErrorNoteCard(
                      note: note,
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.safeBlockVertical * 15,
                    ),
                    child: NoteCard(
                      note: note,
                    ),
                  );
                }
              },
            );
          },
          loadFailure: (state) {
            return Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 15,
              ),
              child: CriticalFailure(
                noteFailure: state.noteFailure,
              ),
            );
          },
        );
      },
    );
  }
}
