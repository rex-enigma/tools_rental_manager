import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tools_rental_management/assets/font_icons/font_icons.dart';
import 'package:tools_rental_management/enums/national_id_side.dart';

/// button that displays national id.
class NationalIdButton extends StatelessWidget {
  /// image path either for a front national id or back national id.
  final String? nationalIdImage;
  final NationalIdSide nationalIdSide;
  final VoidCallback onPressed;

  const NationalIdButton({
    required this.onPressed,
    required this.nationalIdImage,
    required this.nationalIdSide,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      // DottedBorder is a third-party package
      child: DottedBorder(
        dashPattern: const [8, 8],
        strokeCap: StrokeCap.square,
        color: Theme.of(context).colorScheme.onPrimary,
        child: Container(
          width: 180,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          child: Stack(
            children: [
              nationalIdImage == null
                  ? switch (nationalIdSide) {
                      NationalIdSide.front => Image.asset(
                          'lib/assets/images/front_national_id_placeholder.png',
                          fit: BoxFit.cover,
                        ),
                      NationalIdSide.back => Image.asset(
                          'lib/assets/images/back_national_id_placeholder.png',
                          fit: BoxFit.cover,
                        ),
                    }
                  : Image.asset(
                      nationalIdImage!,
                      fit: BoxFit.cover,
                    ),
              if (nationalIdImage == null)
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  child: Text(
                    switch (nationalIdSide) {
                      NationalIdSide.front => 'Front',
                      NationalIdSide.back => 'Back',
                    },
                  ),
                ),
              if (nationalIdImage == null)
                const Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.photo_camera),
                )
            ],
          ),
        ),
      ),
    );
  }
}
