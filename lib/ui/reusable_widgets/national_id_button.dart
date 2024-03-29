import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tools_rental_management/enums/national_id_side.dart';

/// button that displays national id.
class NationalIdButton extends StatelessWidget {
  /// image path either for a front national id or back national id.
  final String? nationalIdImage;
  final NationalIdSide nationalIdSide;
  final VoidCallback onPressed;

  /// checks if the Wrapping FormField has any error
  final bool hasError;

  /// will be displayed if the wrapping formField validator returns a string representing an error text
  final String? errorMessage;

  const NationalIdButton({
    required this.onPressed,
    required this.nationalIdImage,
    required this.nationalIdSide,
    this.hasError = false,
    this.errorMessage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      // DottedBorder is a third-party package
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DottedBorder(
            dashPattern: hasError ? [8, 1] : [8, 8],
            strokeCap: StrokeCap.square,
            color:
                hasError ? Colors.red : Theme.of(context).colorScheme.onPrimary,
            child: Container(
              width: 180,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: nationalIdImage != null
                  ? Image.file(
                      File(nationalIdImage!),
                      fit: BoxFit.cover,
                    )
                  : Stack(
                      children: [
                        switch (nationalIdSide) {
                          NationalIdSide.front => Image.asset(
                              'lib/assets/images/front_national_id_placeholder.png',
                              fit: BoxFit.cover,
                            ),
                          NationalIdSide.back => Image.asset(
                              'lib/assets/images/back_national_id_placeholder.png',
                              fit: BoxFit.cover,
                            ),
                        },
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          child: Text(
                            switch (nationalIdSide) {
                              NationalIdSide.front => 'Front',
                              NationalIdSide.back => 'Back',
                            },
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.photo_camera,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
            ),
          ),
          if (hasError == true && errorMessage != null)
            Text(
              errorMessage!,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 14,
                color: Colors.red,
              ),
            )
        ],
      ),
    );
  }
}

// Stack(
//                 children: [
//                   nationalIdImage == null
//                       ? switch (nationalIdSide) {
//                           NationalIdSide.front => Image.asset(
//                               'lib/assets/images/front_national_id_placeholder.png',
//                               fit: BoxFit.cover,
//                             ),
//                           NationalIdSide.back => Image.asset(
//                               'lib/assets/images/back_national_id_placeholder.png',
//                               fit: BoxFit.cover,
//                             ),
//                         }
//                       : Align(
//                           child: Image.file(
//                             File(nationalIdImage!),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                   if (nationalIdImage == null)
//                     Positioned(
//                       top: 0.0,
//                       left: 0.0,
//                       child: Text(
//                         switch (nationalIdSide) {
//                           NationalIdSide.front => 'Front',
//                           NationalIdSide.back => 'Back',
//                         },
//                         style: const TextStyle(
//                           fontSize: 14.0,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   if (nationalIdImage == null)
//                     const Align(
//                       alignment: Alignment.center,
//                       child: Icon(
//                         Icons.photo_camera,
//                         color: Colors.black,
//                       ),
//                     )
//                 ],
//               ),
