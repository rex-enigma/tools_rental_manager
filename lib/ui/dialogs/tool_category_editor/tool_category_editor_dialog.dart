import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/ui/common/app_colors.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/edit_dialog.dart';
import 'package:tools_rental_management/ui/reusable_widgets/input_text_style.dart';

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
        style: textFormFieldInputTextStyle(context),
        // other properties of the InputDecorator will be inherited from ThemeData.inputDecorationTheme
        decoration: const InputDecoration(
          labelText: 'Category *',
        ),
        items: Category.values
            .map(
              (category) => DropdownMenuItem(
                value: category.name,
                child: Text(category.name),
              ),
            )
            .toList(),
        onChanged: (value) => {},
      ),
      onSaved: () {},
      onCancelled: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  ToolCategoryEditorDialogModel viewModelBuilder(BuildContext context) =>
      ToolCategoryEditorDialogModel();
}
