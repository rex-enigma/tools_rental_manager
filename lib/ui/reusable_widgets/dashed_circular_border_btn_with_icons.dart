import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/assets/font_icons/font_icons.dart';

// i havent yet figured out which easier name to give this button
/// [DashedCircularBorderButtonWithIcons] created a circular button which has dashed border and 3
/// widget stacked on top of each other. The first widget is a greyish background, second widget is an
/// icon(either a FontIcons.circularSaw or Icons.person) and the last is an icon(Icons.photo_camera).
/// [BottomSheetType] is need so that we can be able to create a [DashedCircularBorderButtonWithIcons] with either
/// a [circularSaw] icon or a [person] icon as second widget in the stack.
/// [imagePath] is the path of a tool image to be displayed inside the button.
class DashedCircularBorderButtonWithIcons extends StatelessWidget {
  final BottomSheetType bottomSheetType;

  /// image path either for a tool image or toolUser image depending on the bottomSheetType.
  final String? imagePath;
  final VoidCallback onPressed;

  const DashedCircularBorderButtonWithIcons({
    required this.bottomSheetType,
    required this.imagePath,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      // DottedBorder is a third-party package
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
                  child: imagePath == null
                      ? Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(244, 244, 244, 1),
                          ),
                        )
                      : Image.asset(
                          imagePath!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              if (imagePath == null)
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
                        size: 80.0,
                      ),
                  },
                ),
              if (imagePath == null)
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
