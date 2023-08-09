import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/ui/reusable_widgets/image_view.dart';

import 'tool_user_image_viewmodel.dart';

class ToolUserImageView extends StackedView<ToolUserImageViewModel> {
  const ToolUserImageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolUserImageViewModel viewModel,
    Widget? child,
  ) {
    return ImageView(
      title: 'Profile photo',
      imagePath: viewModel.toolUserImagePath,
      placeholderImage: const Icon(
        Icons.person,
        color: Colors.grey,
      ),
      onPressedEditButton: () => viewModel.showToolUserImageCaptureBottomSheet(),
      navigateBack: () => Navigator.of(context).pop(),
    );
  }

  @override
  ToolUserImageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToolUserImageViewModel();
}
