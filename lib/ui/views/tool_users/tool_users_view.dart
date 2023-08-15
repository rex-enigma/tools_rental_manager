import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:tools_rental_management/ui/reusable_widgets/appBar_with_search_field.dart';
import 'package:tools_rental_management/ui/reusable_widgets/custom_listtile.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';
import 'package:tools_rental_management/ui/views/tool_names/tool_names_view.dart';

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
      appBar: PreferredSize(
        preferredSize: Size(screenWidth(context), 60),
        child: AppBarWithSearchField(
          title: Text(
            'Tool Users',
            style: appBarTitleTextStyle(context),
          ),
          showAppBarSearchField: viewModel.showAppBarSearchField,
          searchFieldTextHint: 'search for a tool user by name',
          onSearchFieldValueChanged: (value) {
            viewModel.searchToolUser(value);
          },
          actions: [
            IconButton(
              // if the viewModel.toolUsers list is empty, it means there aren't any tools in the database, so we disable the search button preventing the user from searching for tool users that don't exist
              onPressed: viewModel.toolUsers.isEmpty
                  ? null
                  : () {
                      viewModel.showAppBarSearchField = !viewModel.showAppBarSearchField;
                      // if viewModel.showAppBarSearchField = false, (the user cancelled search) we reset filtered tool users to default
                      if (!viewModel.showAppBarSearchField) viewModel.resetFilteredToolUsersToDefault();
                    },
              icon: viewModel.showAppBarSearchField
                  ? Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : Icon(
                      Icons.search,
                      // use grey color to indicate that the button is disabled when viewMode.toolUsers is empty
                      color: viewModel.toolUsers.isEmpty ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.secondary,
                    ),
            ),
          ],
        ),
      ),
      body: DefaultTextStyle(
        style: switch (getThemeManager(context).selectedThemeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
          ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
          _ => throw ' configure ThemeMode.system',
        },
        child: viewModel.toolUsers.isEmpty
            ? Center(
                child: Text(
                  'click + button to add a tool user',
                ),
              )
            : ListView(
                children: viewModel.filteredToolUsers.map(
                  (toolUser) {
                    return InkWell(
                      onTap: () {
                        print('${toolUser.firstName} has been  tapped'); // its here for testing
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 5.0, top: 10.0, bottom: 10.0),
                        child: CustomListTile(
                          contentVerticalAlignment: CrossAxisAlignment.center,
                          leading: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              //color: const Color.fromARGB(64, 158, 158, 158),
                            ),
                            child: toolUser.avatarImagePath.isEmpty
                                ? const FittedBox(
                                    child: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ))
                                : Image.asset(
                                    toolUser.avatarImagePath,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          title: Text(
                            '${toolUser.firstName} ${toolUser.lastName}',
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
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Phone number : ',
                                      style: subtitleFirstSubStringTextStyle(context),
                                    ),
                                    TextSpan(
                                      text: toolUser.phoneNumber.toString(),
                                      style: subtitleLastSubStringTextStyle(context),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Tool count : ',
                                      style: subtitleFirstSubStringTextStyle(context),
                                    ),
                                    TextSpan(
                                      text: toolUser.tools?.length.toString() ?? '0',
                                      style: subtitleLastSubStringTextStyle(context),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          trailing:
                              toolUser.tools == null // if toolUser.tools is null, it means that the tool user is not using any tool (no tool(s) is associated with  that tool user)
                                  ? IconButton(
                                      visualDensity: VisualDensity.compact,
                                      iconSize: 26,
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        print('${toolUser.firstName} will be deleted'); // implement a delete functionality to delete retired tools
                                      },
                                    )
                                  : null,
                        ),
                      ),
                    );
                  },
                ).toList(),
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

  @override
  void onViewModelReady(ToolUsersViewModel viewModel) {
    viewModel.initState();
    super.onViewModelReady(viewModel);
  }
}
