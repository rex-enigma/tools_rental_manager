import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/assets/font_icons/font_icons.dart';

/// [DashedCircularButtonBorderWithIcons] created a circular button which has dashed border and 3
/// widget stacked on top of each other. The first widget is a greyish background, second widget is an
/// icon(either a FontIcons.circularSaw or Icons.person) and the last is an icon(Icons.photo_camera).
/// [BottomSheetType] is need so that we can be able to create a [DashedCircularButtonBorderWithIcons] with either
/// a [circularSaw] icon or a [person] icon as second widget in the stack.
/// [toolImagePath] is the path of a tool image to be displayed.
class DashedCircularButtonBorderWithIcons extends StatelessWidget {
  final BottomSheetType bottomSheetType;
  final String? toolImagePath;

  const DashedCircularButtonBorderWithIcons({
    required this.bottomSheetType,
    required this.toolImagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle button tap
        print('add a tool photo');
      },
      child: DottedBorder(
        borderType: BorderType.Circle,
        dashPattern: const [8, 8],
        strokeCap: StrokeCap.square,
        color: Theme.of(context).colorScheme.onPrimary,
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipOval(
                  child: toolImagePath == null
                      ? Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(244, 244, 244, 1),
                          ),
                        )
                      : Image.asset(
                          toolImagePath!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              if (toolImagePath == null)
                Align(
                  alignment: Alignment.center,
                  child: switch (bottomSheetType) {
                    BottomSheetType.toolCreator => const Icon(
                        FontIcons.circularSaw,
                        color: Color.fromRGBO(202, 202, 202, 1.0),
                        size: 56.0,
                      ),
                    BottomSheetType.toolUserCreator => const Icon(
                        Icons.person,
                        color: Color.fromRGBO(202, 202, 202, 1.0),
                      ),
                  },
                ),
              if (toolImagePath == null)
                const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.photo_camera,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
