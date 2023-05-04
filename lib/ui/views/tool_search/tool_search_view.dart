import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tool_search_viewmodel.dart';

class ToolSearchView extends StackedView<ToolSearchViewModel> {
  const ToolSearchView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolSearchViewModel viewModel,
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
  ToolSearchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToolSearchViewModel();
}
