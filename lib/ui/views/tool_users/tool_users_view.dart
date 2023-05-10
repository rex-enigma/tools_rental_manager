import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/app/app.locator.dart';

import 'tool_users_viewmodel.dart';

class ToolUsersView extends StackedView<ToolUsersViewModel> {
  const ToolUsersView({Key? key}) : super(key: key);

  // setting it to false will make sure that [ToolsViewModel] isn't disposed (ToolsViewModel.dispose function isn't called).
  @override
  bool get disposeViewModel => false;

  // setting it to true  will tell the ViewModelBuilder you want only the initialization for a specialty view model to fire once
  @override
  bool get initialiseSpecialViewModelsOnce => true;

  @override
  Widget builder(
    BuildContext context,
    ToolUsersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  @override
  ToolUsersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      locator<ToolUsersViewModel>();
}
