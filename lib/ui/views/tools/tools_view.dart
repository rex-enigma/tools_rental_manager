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
                ))
          ],
          title: Center(
            child: Text(
              'Tools',
              style: MyApp.of(context).themeMode == ThemeMode.light ? Theme.of(context).typography.white.bodyLarge : Theme.of(context).typography.black.bodyLarge,
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
                    width: MyApp.of(context).themeMode == ThemeMode.light ? 0.5 : 0.1,
                  ),
                ),
              ),
              child: TabBar(
                labelStyle: MyApp.of(context).themeMode == ThemeMode.light ? Theme.of(context).typography.white.bodyMedium : Theme.of(context).typography.black.bodyMedium,
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
          style: MyApp.of(context).themeMode == ThemeMode.light ? Theme.of(context).typography.white.bodyMedium! : Theme.of(context).typography.black.bodyMedium!,
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
          onPressed: viewModel.showBottomSheet,
          child: Icon(
            Icons.add,
            color: MyApp.of(context).themeMode == ThemeMode.light ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onPrimary,
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
