import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/main.dart';

import 'tools_viewmodel.dart';

class ToolsView extends StackedView<ToolsViewModel> {
  const ToolsView({Key? key}) : super(key: key);

  // setting it to false will make sure that [ToolsViewModel] isn't disposed (ToolsViewModel.dispose function isn't called).
  @override
  bool get disposeViewModel => false;

  // setting it to true  will tell the ViewModelBuilder you want only the initialization for a specialty view model to fire once
  @override
  bool get initialiseSpecialViewModelsOnce => true;

  @override
  Widget builder(
    BuildContext context,
    ToolsViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.filter_list,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ],
          title: Center(
            child: Text(
              'Tools',
              style: switch (MyApp.of(context).themeMode) {
                ThemeMode.light => Theme.of(context).typography.white.bodyLarge,
                ThemeMode.dark => Theme.of(context).typography.black.bodyLarge,
                _ => throw 'configure ThemeMode.system',
              },
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(46.0),
            child: Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                border: Border(
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
              child: TabBar(
                labelStyle: switch (MyApp.of(context).themeMode) {
                  ThemeMode.light => Theme.of(context).typography.white.bodyMedium,
                  ThemeMode.dark => Theme.of(context).typography.black.bodyMedium,
                  _ => throw ' configure ThemeMode.system',
                },
                unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
                labelColor: Theme.of(context).colorScheme.secondary,
                isScrollable: true,
                dividerColor: Colors.transparent,
                tabs: const <Widget>[
                  Tab(
                    text: 'All',
                  ),
                  Tab(
                    text: 'Powered tools',
                  ),
                  Tab(
                    text: 'Unpowered tools',
                  )
                ],
              ),
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
            child: TabBarView(
              children: <Widget>[
                Center(
                  child: Text('click + button to add a tool'),
                ),
                Center(
                  child: Text('click + button to add a Power tool'),
                ),
                Center(
                  child: Text('click + button to add Unpowered tool'),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: viewModel.showToolCreatorBottomSheet,
          child: Icon(
            Icons.add,
            color: switch (MyApp.of(context).themeMode) {
              ThemeMode.light => Theme.of(context).colorScheme.primary,
              ThemeMode.dark => Theme.of(context).colorScheme.onPrimary,
              _ => throw ' configure ThemeMode.system',
            },
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  @override
  ToolsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      locator<ToolsViewModel>();
}
