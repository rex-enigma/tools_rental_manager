import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/main.dart';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: const SizedBox(),
        title: Center(
          child: Text(
            'Tool Users',
            style: switch (MyApp.of(context).themeMode) {
              ThemeMode.light => Theme.of(context).typography.white.bodyLarge,
              ThemeMode.dark => Theme.of(context).typography.black.bodyLarge,
              _ => throw 'configure ThemeMode.system',
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: switch (MyApp.of(context).themeMode) {
              ThemeMode.light => 0.5,
              ThemeMode.dark => 0.1,
              _ => throw 'configure ThemeMode.system',
            },
          ),
        ),
      ),
      body: DefaultTextStyle(
        style: switch (MyApp.of(context).themeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
          ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
          _ => throw ' configure ThemeMode.system',
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Center(
            child: Text('Click + button to add a tool user'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.showUserCreatorBottomSheet,
        child: Icon(
          Icons.add,
          color: switch (MyApp.of(context).themeMode) {
            ThemeMode.light => Theme.of(context).colorScheme.primary,
            ThemeMode.dark => Theme.of(context).colorScheme.onPrimary,
            _ => throw 'configure ThemeMode.system',
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  @override
  ToolUsersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      locator<ToolUsersViewModel>();
}
