import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tool_image_viewmodel.dart';

class ToolImageView extends StackedView<ToolImageViewModel> {
  const ToolImageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolImageViewModel viewModel,
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
  ToolImageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToolImageViewModel();
}
