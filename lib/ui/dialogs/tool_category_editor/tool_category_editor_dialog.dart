import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/edit_dialog_layout.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';

import 'tool_category_editor_dialog_model.dart';

class ToolCategoryEditorDialog
    extends StackedView<ToolCategoryEditorDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ToolCategoryEditorDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolCategoryEditorDialogModel viewModel,
    Widget? child,
  ) {
    return EditDialog(
      title: Text(
        'Edit tool category',
        style: switch (getThemeManager(context).selectedThemeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
          ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
          _ => throw ' configure ThemeMode.system',
        },
      ),
      input: DropdownButtonFormField(
        value: viewModel.category ?? request.data,
        style: textFormFieldInputTextStyle(context),
        // other properties of the InputDecorator will be inherited from ThemeData.inputDecorationTheme
        decoration: const InputDecoration(
          labelText: 'Category *',
        ),
        items: Category.values
            .map(
              (category) => DropdownMenuItem(
                value: category,
                child: Text(category.name),
              ),
            )
            .toList(),
        onChanged: (value) {
          viewModel.setCategoryValue(value as Category);
        },
      ),
      onSaved: () {
        completer(DialogResponse(data: viewModel.category));
      },
      onCancelled: () {
        completer(DialogResponse(data: null));
      },
    );
  }

  @override
  ToolCategoryEditorDialogModel viewModelBuilder(BuildContext context) =>
      ToolCategoryEditorDialogModel();
}
