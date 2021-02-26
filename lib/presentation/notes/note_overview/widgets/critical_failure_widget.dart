import 'package:flutter/material.dart';
import 'package:to_do/domain/notes/note_failure.dart';
// import 'package:to_do/shared/sizeconfig.dart';

class CriticalFailure extends StatelessWidget {
  final NoteFailure noteFailure;

  const CriticalFailure({
    Key key,
    @required this.noteFailure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Image(
            // width: SizeConfig.safeBlockHorizontal * 360,
            image: AssetImage('images/error_404.jpg'),
          ),
        ],
      ),
    );
  }
}
