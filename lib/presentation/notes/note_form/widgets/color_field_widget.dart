import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/application/notes/note_form/note_form_bloc.dart';
import 'package:to_do/domain/notes/value_objects.dart';
import 'package:to_do/shared/sizeconfig.dart';

class ColorField extends StatelessWidget {
  const ColorField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormBloc, NoteFormState>(
      buildWhen: (previousState, currentState) =>
          previousState.note.color != currentState.note.color,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.safeBlockVertical * 100,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 55,
                  );
                },
                itemCount: NoteColor.predefinedColors.length,
                itemBuilder: (context, index) {
                  final itemColor = NoteColor.predefinedColors[index];
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<NoteFormBloc>()
                          .add(NoteFormEvent.colorChanged(itemColor));
                    },
                    child: Material(
                      color: itemColor,
                      shape: CircleBorder(
                        side: state.note.color.value.fold(
                          (_) => BorderSide.none,
                          (color) => color == itemColor
                              ? const BorderSide(width: 2.5)
                              : const BorderSide(
                                  width: 0,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                      child: SizedBox(
                        height: SizeConfig.safeBlockVertical * 40,
                        width: SizeConfig.safeBlockVertical * 40,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
