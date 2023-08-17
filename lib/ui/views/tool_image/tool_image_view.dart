import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/ui/reusable_widgets/image_view_layout.dart';

import 'tool_image_viewmodel.dart';

class ToolImageView extends StackedView<ToolImageViewModel> {
  final int toolId;
  const ToolImageView({Key? key, required this.toolId}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolImageViewModel viewModel,
    Widget? child,
  ) {
    return ImageView(
      title: viewModel.toolName ?? 'Tool Name',
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
  ToolImageViewModel viewModelBuilder(BuildContext context) => ToolImageViewModel();

  @override
  void onViewModelReady(ToolImageViewModel viewModel) {
    viewModel.initState(toolId);
    super.onViewModelReady(viewModel);
  }
}
