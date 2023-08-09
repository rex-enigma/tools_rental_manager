import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:tools_rental_management/ui/reusable_widgets/input_text_style.dart';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Theme.of(context).colorScheme.onPrimary,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: viewModel.showAppBarTextField
            ? ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 40,
                ),
                child: TextField(
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  cursorWidth: 1,
                  style: textFormFieldInputTextStyle(context),
                  decoration: const InputDecoration(
                    hintText: 'search for a tool name',
                  ),
                  onChanged: (value) => viewModel.filterToolNames(value),
                ),
              )
            : Text(
                'Tool names',
                style: switch (getThemeManager(context).selectedThemeMode) {
                  ThemeMode.light => Theme.of(context).typography.white.bodyLarge,
                  ThemeMode.dark => Theme.of(context).typography.black.bodyLarge,
                  _ => throw 'configure ThemeMode.system',
                },
              ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.showAppBarTextField = !viewModel.showAppBarTextField;
              if (!viewModel.showAppBarTextField) viewModel.resetFilteredToolNameToDefault();
            },
            icon: viewModel.showAppBarTextField
                ? Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.onPrimary,
                  )
                : Icon(
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
                  ThemeMode.light => Theme.of(context).typography.white.bodyMedium,
                  ThemeMode.dark => Theme.of(context).typography.black.bodyMedium,
                  _ => throw 'configure ThemeMode.system',
                },
              ),
              onPressed: () => Navigator.of(context).pop(toolName), // pop this view and return the name of a tool associated with this TextButton
            ),
          );
        },
      ),
    );
  }

  @override
  ToolNamesViewModel viewModelBuilder(BuildContext context) => ToolNamesViewModel();

  @override
  void onViewModelReady(ToolNamesViewModel viewModel) {
    // initialize the viewModel state
    viewModel.initState();

    // super.onViewModelReady(viewModel);
  }
}
