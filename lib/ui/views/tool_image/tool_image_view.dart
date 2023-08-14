import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/ui/reusable_widgets/image_view_layout.dart';

import 'tool_image_viewmodel.dart';

class ToolImageView extends StackedView<ToolImageViewModel> {
  const ToolImageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolImageViewModel viewModel,
    Widget? child,
  ) {
    return ImageView(
      title: viewModel.toolImagePath ?? 'Tool Name',
      imagePath: viewModel.toolImagePath,
      placeholderImage: const Icon(
        Icons.construction_outlined,
        color: Colors.grey,
      ),
      onPressedEditButton: () => viewModel.showToolImageCaptureBottomSheet(),
      navigateBack: () => Navigator.of(context).pop(),
    );
  }

  @override
  ToolImageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToolImageViewModel();
}
