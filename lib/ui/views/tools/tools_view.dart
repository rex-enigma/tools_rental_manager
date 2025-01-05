import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/models/tool.dart';
import 'package:tools_rental_management/enums/status.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:tools_rental_management/ui/reusable_widgets/appBar_with_search_field.dart';
import 'package:tools_rental_management/ui/reusable_widgets/custom_listtile.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';
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

  // @override
  // bool get fireOnViewModelReadyOnce => true;

  @override
  Widget builder(
    BuildContext context,
    ToolsViewModel viewModel,
    Widget? child,
  ) {
    return MyTabBarView(viewModel);
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

class MyTabBarView extends StatefulWidget {
  final ToolsViewModel toolsViewModel;

  const MyTabBarView(
    this.toolsViewModel, {
    super.key,
  });

  @override
  State<MyTabBarView> createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.toolsViewModel.currentSelectedTab,
    );
    tabController.addListener(handleTabTappedOrTabBarViewSwiped);
    super.initState();
  }

  /// invoked when a tab is tapped or when a tabBarView is swiped.
  void handleTabTappedOrTabBarViewSwiped() {
    widget.toolsViewModel.changeTab(tabController.index);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ToolsViewModel toolsViewModel = widget.toolsViewModel;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: PreferredSize(
        preferredSize: Size(screenWidth(context), 100),
        child: AppBarWithSearchField(
          showAppBarSearchField: toolsViewModel.showAppBarSearchField,
          searchFieldTextHint: 'search for a tool by name',
          onSearchFieldValueChanged: (value) => toolsViewModel.searchForAToolInATabView(value),
          leading: IconButton(
            // disable this button if there is not tools gotten from the database, preventing the user from initiating search for a tool
            onPressed: toolsViewModel.tools.isEmpty
                ? null
                : () {
                    toolsViewModel.showAppBarSearchField = !toolsViewModel.showAppBarSearchField;
                    // if toolsViewModel.showAppBarSearchField = false, (the user cancelled search) we rest the corresponding TabView tools to default
                    if (!toolsViewModel.showAppBarSearchField) {
                      toolsViewModel.resetTabViewToolsToDefault();
                    }
                  },
            icon: toolsViewModel.showAppBarSearchField
                ? Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.secondary,
                  )
                : Icon(
                    Icons.search,
                    // use the disabledColor if toolsViewModel.tools is empty, showing the user the search button is disabled, since there is any tools to search for
                    color: toolsViewModel.tools.isEmpty ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.secondary,
                  ),
          ),
          title: Text(
            'Tools',
            style: appBarTitleTextStyle(context),
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
                      labelTextStyle: WidgetStatePropertyAll(
                        TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    );
                  },
                ).toList();
              },
              onSelected: (value) => toolsViewModel.onMenuStatusFilter(value),
              icon: Icon(
                Icons.filter_list,
                // use a disable color when the searchField is shown or when toolsViewModel.tools is empty (prevent the user from filtering empty tools list)
                color: toolsViewModel.showAppBarSearchField || toolsViewModel.tools.isEmpty ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.secondary,
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
                controller: tabController,
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Tab(
                      text: 'All',
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Tab(
                      text: 'Powered tools',
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Tab(
                      text: 'Unpowered tools',
                    ),
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
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            toolsViewModel.isBusy
                ? Center(child: CircularProgressIndicator(backgroundColor: Theme.of(context).colorScheme.secondary))
                : createTabBarViewChild(toolsViewModel.allToolsTabView), // toolViewModel.currentSelectedTab = 0

            toolsViewModel.isBusy
                ? Center(child: CircularProgressIndicator(backgroundColor: Theme.of(context).colorScheme.secondary))
                : createTabBarViewChild(toolsViewModel.poweredToolsTabView), // toolViewModel.currentSelectedTab = 1

            toolsViewModel.isBusy
                ? Center(child: CircularProgressIndicator(backgroundColor: Theme.of(context).colorScheme.secondary))
                : createTabBarViewChild(toolsViewModel.unPoweredToolsTabView), // toolViewModel.currentSelectedTab = 2
          ],
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

  Widget createTabBarViewChild(List<Tool> tabBarViewChild) {
    ToolsViewModel toolsViewModel = widget.toolsViewModel;
    // if (toolsViewModel.tools is empty && toolsViewModel.showAppBarSearchField is false) we know that there is no tools in the database so we return a centred text that request the user to add a tool
    // otherwise return a list of tools from toolsViewModel.allToolsTabView/poweredToolsTabView/unPoweredToolsTabView
    return (toolsViewModel.tools.isEmpty && toolsViewModel.showAppBarSearchField == false
        ? const Center(
            child: Text('click + button to add a tool'),
          )
        :
        // return tools for the given tabBarViewChild or centred text saying 'No tool found the given search name' if the user has initiated search and searched for a tool that doesn't exist
        tabBarViewChild.isEmpty && toolsViewModel.showAppBarSearchField
            ? const Center(
                child: Text('No tool found for the given search name'),
              )
            : ListView(
                children: tabBarViewChild.map(
                  (tool) {
                    return InkWell(
                      onTap: () {
                        toolsViewModel.navigateToToolView(tool.toolId!);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 5.0, top: 10.0, bottom: 10.0),
                        child: CustomListTile(
                          contentVerticalAlignment: CrossAxisAlignment.start,
                          leading: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                              //color: const Color.fromARGB(64, 158, 158, 158),
                            ),
                            child: tool.toolImagePath.isEmpty
                                ? const FittedBox(
                                    child: Icon(
                                      Icons.construction,
                                      color: Colors.grey,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.file(
                                      File(tool.toolImagePath),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          title: Text(
                            tool.name,
                            style: switch (getThemeManager(context).selectedThemeMode) {
                              ThemeMode.light => Theme.of(context).typography.white.titleMedium!,
                              ThemeMode.dark => Theme.of(context).typography.black.titleMedium!,
                              _ => throw ' configure ThemeMode.system',
                            },
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Status : ',
                                      style: subtitleFirstSubStringTextStyle(context),
                                    ),
                                    TextSpan(
                                      text: tool.status.name,
                                      style: subtitleLastSubStringTextStyle(context, status: tool.status),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Current tool user : ',
                                      style: subtitleFirstSubStringTextStyle(context),
                                    ),
                                    TextSpan(
                                      // if toolUserId is null, it means there is no toolUser using this tool represented by CustomListTile
                                      text: tool.toolUserId == null ? 'none' : toolsViewModel.getToolUserFullName(tool.toolUserId!),
                                      style: subtitleLastSubStringTextStyle(context),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Tool unique id : ',
                                      style: subtitleFirstSubStringTextStyle(context),
                                    ),
                                    TextSpan(
                                      text: tool.toolUniqueId.toString(),
                                      style: subtitleLastSubStringTextStyle(context),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          trailing: tool.status == Status.retired // only show delete icon if a tool is retired (Status.retired) otherwise return null
                              ? IconButton(
                                  visualDensity: VisualDensity.compact,
                                  iconSize: 26,
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    toolsViewModel.showToolDeleteConfirmDialog(tool);
                                  },
                                )
                              : null,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ));
  }
}
