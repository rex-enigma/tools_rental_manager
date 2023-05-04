import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tool_users_viewmodel.dart';

class ToolUsersView extends StackedView<ToolUsersViewModel> {
  const ToolUsersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolUsersViewModel viewModel,
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
                  color: Colors.green,
                ),
              ),
            )),
      ),
    );
  }

  @override
  ToolUsersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToolUsersViewModel();
}
