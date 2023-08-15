import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:tools_rental_management/ui/reusable_widgets/appBar_with_search_field.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';

import 'tool_names_viewmodel.dart';

class ToolNamesView extends StackedView<ToolNamesViewModel> {
  const ToolNamesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolNamesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size(screenWidth(context), 60),
        child: AppBarWithSearchField(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Tool names',
            style: appBarTitleTextStyle(context),
          ),
          showAppBarSearchField: viewModel.showAppBarSearchField,
          searchFieldTextHint: 'search for a tool name',
          onSearchFieldValueChanged: (value) {
            viewModel.searchToolName(value);
          },
          actions: [
            IconButton(
              onPressed: () {
                viewModel.showAppBarSearchField =
                    !viewModel.showAppBarSearchField;
                // if viewModel.showAppBarSearchField = false, (the user cancelled search) we reset filtered tool name to default
                if (!viewModel.showAppBarSearchField)
                  viewModel.resetFilteredToolNameToDefault();
              },
              icon: viewModel.showAppBarSearchField
                  ? Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: viewModel.filteredToolNames.length,
        itemBuilder: (context, index) {
          var toolName = viewModel.filteredToolNames[index];
          return ListTile(
            contentPadding: const EdgeInsets.only(left: 15, right: 15.0),
            title: TextButton(
              style: const ButtonStyle(alignment: Alignment.topLeft),
              child: Text(
                toolName,
                style: switch (getThemeManager(context).selectedThemeMode) {
                  ThemeMode.light =>
                    Theme.of(context).typography.white.bodyMedium,
                  ThemeMode.dark =>
                    Theme.of(context).typography.black.bodyMedium,
                  _ => throw 'configure ThemeMode.system',
                },
              ),
              onPressed: () => Navigator.of(context).pop(
                  toolName), // pop this view and return the name of a tool associated with this TextButton
            ),
          );
        },
      ),
    );
  }

  @override
  ToolNamesViewModel viewModelBuilder(BuildContext context) =>
      ToolNamesViewModel();

  @override
  void onViewModelReady(ToolNamesViewModel viewModel) {
    // initialize the viewModel state
    viewModel.initState();

    // super.onViewModelReady(viewModel);
  }
}
