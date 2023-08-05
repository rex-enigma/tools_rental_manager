import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/main.dart';
import 'package:tools_rental_management/ui/views/tool/tool_view.dart';
import 'package:tools_rental_management/ui/views/tool_user/tool_user_view.dart';

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
        centerTitle: true,
        title: Text(
          'Tool Users',
          style: switch (getThemeManager(context).selectedThemeMode) {
            ThemeMode.light => Theme.of(context).typography.white.bodyLarge,
            ThemeMode.dark => Theme.of(context).typography.black.bodyLarge,
            _ => throw 'configure ThemeMode.system',
          },
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
            width: switch (getThemeManager(context).selectedThemeMode) {
              ThemeMode.light => 0.5,
              ThemeMode.dark => 0.1,
              _ => throw 'configure ThemeMode.system',
            },
          ),
        ),
      ),
      body: DefaultTextStyle(
        style: switch (getThemeManager(context).selectedThemeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
          ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
          _ => throw ' configure ThemeMode.system',
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Click + button to add a tool user'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ToolUserView(),
                      ),
                    );
                  },
                  child: const Text(
                    'Tool',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.showUserCreatorBottomSheet,
        child: Icon(
          Icons.person_add,
          color: Theme.of(context).colorScheme.primary,
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
