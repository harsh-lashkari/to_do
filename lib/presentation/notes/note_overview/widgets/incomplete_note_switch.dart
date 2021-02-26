import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/application/notes/note_watcher/note_watcher_bloc.dart';

class IncompleteSwitch extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final toggleState = useState(false);
    return GestureDetector(
      onTap: () {
        toggleState.value = !toggleState.value;
        context.read<NoteWatcherBloc>().add(toggleState.value
            ? const NoteWatcherEvent.watchIncompleteStarted()
            : const NoteWatcherEvent.watchAllStarted());
      },
      child: Text(
        toggleState.value ? 'SHOW ALL' : 'SHOW INCOMPLETE',
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}
