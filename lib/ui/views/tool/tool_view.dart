import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tool_viewmodel.dart';

class ToolView extends StackedView<ToolViewModel> {
  const ToolView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolViewModel viewModel,
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
  ToolViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToolViewModel();
}
