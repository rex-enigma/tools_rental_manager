import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/image_capture_bottom_sheet_layout.dart';

import 'tool_user_image_capture_sheet_model.dart';

class ToolUserImageCaptureSheet
    extends StackedView<ToolUserImageCaptureSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ToolUserImageCaptureSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolUserImageCaptureSheetModel viewModel,
    Widget? child,
  ) {
    return ImageCaptureSheet(
      title: 'Tool user image',
      onPressedCameraButton: () {},
      onPressedGalleryButton: () {},
    );
  }

  @override
  ToolUserImageCaptureSheetModel viewModelBuilder(BuildContext context) =>
      ToolUserImageCaptureSheetModel();
}
