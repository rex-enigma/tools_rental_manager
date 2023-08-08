import 'package:flutter/material.dart';
import 'package:tools_rental_management/ui/common/app_colors.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/image_capture_bottom_sheet.dart';

import 'national_id_image_capture_sheet_model.dart';

class NationalIdImageCaptureSheet
    extends StackedView<NationalIdImageCaptureSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const NationalIdImageCaptureSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NationalIdImageCaptureSheetModel viewModel,
    Widget? child,
  ) {
    return ImageCaptureSheet(
      title: 'National id image',
      onPressedCameraButton: () {},
      onPressedGalleryButton: () {},
    );
  }

  @override
  NationalIdImageCaptureSheetModel viewModelBuilder(BuildContext context) =>
      NationalIdImageCaptureSheetModel();
}
