import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/image_capture_bottom_sheet_layout.dart';

import 'tool_image_capture_sheet_model.dart';

class ToolImageCaptureSheet extends StackedView<ToolImageCaptureSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ToolImageCaptureSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolImageCaptureSheetModel viewModel,
    Widget? child,
  ) {
    return ImageCaptureSheet(
      title: 'Tool image',
      onPressedCameraButton: () {
        viewModel.fetchImageFromCamera();
      },
      onPressedGalleryButton: () {
        viewModel.fetchImageFromGallery();
      },
    );
  }

  @override
  ToolImageCaptureSheetModel viewModelBuilder(BuildContext context) => ToolImageCaptureSheetModel();

  @override
  void onViewModelReady(ToolImageCaptureSheetModel viewModel) {
    viewModel.imagePath = request.data;
    super.onViewModelReady(viewModel);
  }
}
