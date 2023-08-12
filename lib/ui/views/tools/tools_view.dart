import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/main.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:tools_rental_management/ui/reusable_widgets/appBar_title_text_style.dart';
import 'package:tools_rental_management/ui/reusable_widgets/appBar_with_search_field.dart';
import 'package:tools_rental_management/ui/views/tools/menu_status_filter.dart';

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
  bool get fireOnViewModelReadyOnce => true;

  @override
  Widget builder(
    BuildContext context,
    ToolsViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 3,
      initialIndex: viewModel.currentSelectedTab,
      child: MyTabBarView(viewModel),
    );
  }

  @override
  ToolsViewModel viewModelBuilder(BuildContext context) => locator<ToolsViewModel>(); // toolsViewModel is persisted between ToolsView Rebuilds.

  // i want some function to be invoked when ToolsView is rebuild
  // am going to test out onViewModelReady to see if it works that one or i need to used another function
  // and tweek some properties.
  // i want it to mostly call a function that gets all the tools from the database because whn a use navigate to ToolUsersView
  // thy might end up updating a tool associated with that tool user, hence the refetching the tools is necessary

  @override
  void onViewModelReady(ToolsViewModel viewModel) {
    viewModel.initState();
  }
}

class MyTabBarView extends StatelessWidget {
  final ToolsViewModel toolsViewModel;
  late final TabController tabController;
  MyTabBarView(
    this.toolsViewModel, {
    super.key,
  });

  /// invoked when a tab is tapped or when a tabBarView is swiped.
  void handleTabTappedAndTabBarViewSwiped() {
    toolsViewModel.changeTab(tabController.index);
  }

  @override
  Widget build(BuildContext context) {
    tabController = DefaultTabController.of(context);
    tabController.addListener(handleTabTappedAndTabBarViewSwiped);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size(screenWidth(context), 100),
        child: AppBarWithSearchField(
          showAppBarSearchField: toolsViewModel.showAppBarSearchField,
          searchFieldTextHint: 'search for a tool by name',
          onSearchFieldValueChanged: (value) => toolsViewModel.searchForAToolInATabView(value),
          leading: IconButton(
            onPressed: () {
              toolsViewModel.showAppBarSearchField = !toolsViewModel.showAppBarSearchField;
              // if toolsViewModel.showAppBarSearchField = false, (the user cancelled search) we rest the corresponding TabView tools to default
              if (!toolsViewModel.showAppBarSearchField) toolsViewModel.resetTabViewToolsToDefault();
            },
            icon: toolsViewModel.showAppBarSearchField
                ? Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.secondary,
                  )
                : Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
          ),
          title: Text(
            'Tools',
            style: appBarTitleTestStyle(context),
          ),
          actions: [
            PopupMenuButton<MenuStatusFilter>(
              color: Theme.of(context).colorScheme.primary,
              surfaceTintColor: Theme.of(context).colorScheme.secondary,
              initialValue: toolsViewModel.currentSelectedStatusFilter,
              itemBuilder: (context) {
                // build PopMenuItem from a list of [MenuStatusFilter.values]
                return MenuStatusFilter.values.map(
                  (menuStatusFilterValue) {
                    return PopupMenuItem<MenuStatusFilter>(
                      value: menuStatusFilterValue,
                      child: Container(
                        child: Text(
                          //return a string whose uppercase letters have been replaced with lowercase letter and a spaces inserted
                          menuStatusFilterValue.name
                              .replaceAllMapped(
                                RegExp(r'([a-z])([A-Z])'),
                                (match) => '${match.group(1)} ${match.group(2)}',
                              )
                              .toLowerCase(),
                        ),
                      ),
                      labelTextStyle: MaterialStatePropertyAll(
                        TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    );
                  },
                ).toList();
              },
              onSelected: (value) => toolsViewModel.onMenuStatusFilter(value),
              icon: Icon(
                Icons.filter_list,
                // use a disable color when the searchField is shown
                color: toolsViewModel.showAppBarSearchField ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.secondary,
              ),
              // disable [PopupMenuButton] when the searchField is shown
              enabled: toolsViewModel.showAppBarSearchField ? false : true,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(46.0),
            child: Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                border: Border(
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
              child: TabBar(
                labelStyle: switch (getThemeManager(context).selectedThemeMode) {
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
      ),
      body: DefaultTextStyle(
        style: switch (getThemeManager(context).selectedThemeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
          ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
          _ => throw ' configure ThemeMode.system',
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            children: <Widget>[
              // display tools in All tabBarView
              ListView(
                // if  toolsViewModel.allToolsTabView is empty display some text explaining why
                children: toolsViewModel.allToolsTabView.map(
                  (testTool) {
                    return ListTile(
                      leading: Container(
                        width: 90,
                        height: 90,
                        color: Colors.grey,
                      ),
                      title: Text(testTool.testToolName),
                      subtitle: Column(
                        children: [
                          Text('status: ${testTool.status.name}'),
                          Text('category: ${testTool.category.name}'),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
              // display tools in Powered tools tabBarView
              ListView(
                // if  toolsViewModel.poweredToolsTabView is empty display some text explaining why
                children: toolsViewModel.poweredToolsTabView.map(
                  (testTool) {
                    return ListTile(
                      leading: Container(
                        width: 90,
                        height: 90,
                        color: Colors.grey,
                      ),
                      title: Text(testTool.testToolName),
                      subtitle: Column(
                        children: [
                          Text('status: ${testTool.status.name}'),
                          Text('category: ${testTool.category.name}'),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
              // display tools in Unpowered tools tabBarView
              ListView(
                // if  toolsViewModel.unPoweredToolsTabView is empty display some text explaining why
                children: toolsViewModel.unPoweredToolsTabView.map(
                  (testTool) {
                    return ListTile(
                      leading: Container(
                        width: 90,
                        height: 90,
                        color: Colors.grey,
                      ),
                      title: Text(testTool.testToolName),
                      subtitle: Column(
                        children: [
                          Text('status: ${testTool.status.name}'),
                          Text('category: ${testTool.category.name}'),
                        ],
                      ),
                    );
                  },
                ).toList(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toolsViewModel.showToolCreatorBottomSheet,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.primary,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}


// Center(
//                 child: Text('click + button to add a tool'),
//               )


// IconButton(
//           onPressed: () => {},
//           icon: Icon(
//             Icons.search,
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//         ),


// [
//           PopupMenuButton<MenuStatusFilter>(
//             color: Theme.of(context).colorScheme.primary,
//             surfaceTintColor: Theme.of(context).colorScheme.secondary,
//             initialValue: toolsViewModel.currentSelectedStatusFilter,
//             itemBuilder: (context) {
//               // build PopMenuItem from a list of [MenuStatusFilter.values]
//               return MenuStatusFilter.values.map(
//                 (menuStatusFilterValue) {
//                   return PopupMenuItem<MenuStatusFilter>(
//                     value: menuStatusFilterValue,
//                     child: Container(
//                       child: Text(
//                         //return a string whose uppercase letters have been replaced with lowercase letter and a spaces inserted
//                         menuStatusFilterValue.name
//                             .replaceAllMapped(
//                               RegExp(r'([a-z])([A-Z])'),
//                               (match) => '${match.group(1)} ${match.group(2)}',
//                             )
//                             .toLowerCase(),
//                       ),
//                     ),
//                     labelTextStyle: MaterialStatePropertyAll(
//                       TextStyle(color: Theme.of(context).colorScheme.onPrimary),
//                     ),
//                   );
//                 },
//               ).toList();
//             },
//             onSelected: (value) => toolsViewModel.onMenuStatusFilter(value),
//             icon: Icon(
//               Icons.filter_list,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//             enabled: toolsViewModel.showAppBarSearchField ? false : true,
//           ),
//         ]