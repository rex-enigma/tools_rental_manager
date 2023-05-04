import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tools_viewmodel.dart';

class ToolsView extends StackedView<ToolsViewModel> {
  const ToolsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
              ),
            )),
      ),
    );
  }

  @override
  ToolsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToolsViewModel();
}
