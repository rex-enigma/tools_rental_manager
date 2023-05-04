import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tool_user_search_viewmodel.dart';

class ToolUserSearchView extends StackedView<ToolUserSearchViewModel> {
  const ToolUserSearchView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolUserSearchViewModel viewModel,
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
  ToolUserSearchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToolUserSearchViewModel();
}
