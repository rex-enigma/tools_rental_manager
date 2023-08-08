import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:tools_rental_management/ui/reusable_widgets/drag_handle.dart';

class ImageCaptureSheet extends StatelessWidget {
  final String title;
  final VoidCallback onPressedCameraButton;
  final VoidCallback onPressedGalleryButton;
  const ImageCaptureSheet({
    super.key,
    this.title = 'Image capture',
    required this.onPressedCameraButton,
    required this.onPressedGalleryButton,
  });

  @override
  Widget build(BuildContext context) {
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
                    title,
                    style: switch (getThemeManager(context).selectedThemeMode) {
                      ThemeMode.light =>
                        Theme.of(context).typography.white.bodyMedium!,
                      ThemeMode.dark =>
                        Theme.of(context).typography.black.bodyMedium!,
                      _ => throw ' configure ThemeMode.system',
                    },
                  ),
                ],
              ),
            ),
            smallSpaceHorizontalDivider(context),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 10, top: 10, bottom: 20),
              child: Row(
                children: [
                  CustomIconButton(
                    icon: const Icon(Icons.photo_camera),
                    bottomLabel: 'Camera',
                    onPressed: onPressedCameraButton,
                  ),
                  horizontalSpaceLarge,
                  CustomIconButton(
                    icon: const Icon(Icons.photo),
                    bottomLabel: 'Gallery',
                    onPressed: onPressedGalleryButton,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
