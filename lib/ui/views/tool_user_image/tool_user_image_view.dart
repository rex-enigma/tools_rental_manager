import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tool_user_image_viewmodel.dart';

class ToolUserImageView extends StackedView<ToolUserImageViewModel> {
  const ToolUserImageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolUserImageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ToolUserImageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToolUserImageViewModel();
}
