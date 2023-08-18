import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/ui/common/app_colors.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/drag_handle.dart';

import 'image_capture_sheet_model.dart';

class ImageCaptureSheet extends StackedView<ImageCaptureSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ImageCaptureSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ImageCaptureSheetModel viewModel,
    Widget? child,
  ) {
    return DefaultTextStyle(
      style: switch (getThemeManager(context).selectedThemeMode) {
        ThemeMode.light => Theme.of(context).typography.white.bodySmall!,
        ThemeMode.dark => Theme.of(context).typography.black.bodySmall!,
        _ => throw ' configure ThemeMode.system',
      },
      child: Container(
        width: screenWidth(context),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DragHandle(),
                  verticalSpaceSmall,
                  Text(
                    request.title ?? 'National id image',
                    style: switch (getThemeManager(context).selectedThemeMode) {
                      ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
                      ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
                      _ => throw ' configure ThemeMode.system',
                    },
                  ),
                ],
              ),
            ),
            smallSpaceHorizontalDivider(context),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 20),
              child: Row(
                children: [
                  CustomIconButton(
                    icon: const Icon(Icons.photo_camera),
                    bottomLabel: 'Camera',
                    onPressed: () {
                      viewModel.fetchImageFromCamera();
                    },
                  ),
                  horizontalSpaceLarge,
                  CustomIconButton(
                    icon: const Icon(Icons.photo),
                    bottomLabel: 'Gallery',
                    onPressed: () {
                      viewModel.fetchImageFromGallery();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  ImageCaptureSheetModel viewModelBuilder(BuildContext context) => ImageCaptureSheetModel();

  @override
  void onViewModelReady(ImageCaptureSheetModel viewModel) {
    viewModel.imagePath = request.data;
    super.onViewModelReady(viewModel);
  }
}

// ImageCaptureSheetLayout(
//       // expecting the showCustomSheet function that to pass the title of this imageCaptureSheet
//       title: request.title ?? 'National id image',
//       onPressedCameraButton: () {
//         viewModel.fetchImageFromCamera();
//       },
//       onPressedGalleryButton: () {
//         viewModel.fetchImageFromGallery();
//       },
//     );

class CustomIconButton extends StatelessWidget {
  /// label for the button
  final String bottomLabel;
  final Icon icon;
  final VoidCallback onPressed;
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.bottomLabel,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onPressed,
                icon: icon,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
        verticalSpaceSmall,
        Text(
          bottomLabel,
          style: switch (getThemeManager(context).selectedThemeMode) {
            ThemeMode.light => Theme.of(context).typography.white.bodySmall!,
            ThemeMode.dark => Theme.of(context).typography.black.bodySmall!,
            _ => throw ' configure ThemeMode.system',
          },
        ),
      ],
    );
  }
}
