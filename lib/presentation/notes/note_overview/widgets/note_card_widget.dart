import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/application/notes/note_actor/note_actor_bloc.dart';
import 'package:to_do/domain/notes/note.dart';
import 'package:kt_dart/collection.dart';
import 'package:to_do/domain/notes/todo_item.dart';
import 'package:to_do/presentation/routes/router.gr.dart';
import 'package:to_do/shared/color_constants.dart';
import 'package:to_do/shared/sizeconfig.dart';
import 'package:to_do/shared/text_style_constants.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({
    Key key,
    @required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal * 15,
        right: SizeConfig.safeBlockHorizontal * 15,
        // bottom: SizeConfig.safeBlockVertical * 15,
      ),
      child: GestureDetector(
        onTap: () {
          ExtendedNavigator.of(context).pushNoteFormPage(editedNote: note);
        },
        onLongPress: () {
          final noteActorBloc = context.read<NoteActorBloc>();
          _showDeletionDialog(context, noteActorBloc);
        },
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: note.color.getOrCrash(),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizeConfig.safeBlockVertical * 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: note.color.getOrCrash(),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 20,
                      ),
                      child: Text(
                        note.title.getOrCrash(),
                        style: GoogleFonts.roboto(
                          textStyle: kNoteTitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.body.getOrCrash(),
                      style: GoogleFonts.roboto(
                        textStyle: kNoteBodyTextStyle,
                      ),
                    ),
                    if (note.todo.length > 0) ...[
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 10,
                      ),
                      Wrap(
                        children: [
                          ...note.todo
                              .getOrCrash()
                              .map(
                                (todo) => Column(
                                  children: [
                                    SizedBox(
                                      height: SizeConfig.safeBlockVertical * 15,
                                    ),
                                    TodoDisplay(
                                      todo: todo,
                                    ),
                                  ],
                                ),
                              )
                              .iter,
                        ],
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeletionDialog(BuildContext context, NoteActorBloc noteActorBloc) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(
              'Delete Note',
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              note.title.getOrCrash(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'CANCEL',
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  noteActorBloc.add(
                    NoteActorEvent.deleted(note),
                  );
                  ExtendedNavigator.of(context).pop(context);
                },
                child: Text(
                  'DELETE',
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class TodoDisplay extends StatelessWidget {
  final TodoItem todo;

  const TodoDisplay({
    Key key,
    @required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (todo.done)
          Container(
            height: SizeConfig.safeBlockVertical * 20,
            width: SizeConfig.safeBlockVertical * 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kCheckMarkColor,
            ),
            child: Icon(
              Icons.check,
              size: SizeConfig.safeBlockVertical * 15,
              color: Colors.white,
            ),
          ),
        if (!todo.done)
          Container(
            height: SizeConfig.safeBlockVertical * 20,
            width: SizeConfig.safeBlockVertical * 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: Colors.black54,
              ),
            ),
          ),
        SizedBox(
          width: SizeConfig.safeBlockHorizontal * 15,
        ),
        if (todo.done)
          Text(
            todo.name.getOrCrash(),
            style: GoogleFonts.roboto(
              fontSize: 16,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        if (!todo.done)
          Text(
            todo.name.getOrCrash(),
            style: GoogleFonts.roboto(
              fontSize: 16,
            ),
          ),
      ],
    );
  }
}
