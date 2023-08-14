import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/edit_dialog_layout.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';

import 'tool_user_lastname_editor_dialog_model.dart';

const double _graphicSize = 60;

class ToolUserLastnameEditorDialog extends StackedView<ToolUserLastnameEditorDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ToolUserLastnameEditorDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolUserLastnameEditorDialogModel viewModel,
    Widget? child,
  ) {
    return EditDialog(
      title: Text(
        'Edit tool user name',
        style: switch (getThemeManager(context).selectedThemeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
          ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
          _ => throw ' configure ThemeMode.system',
        },
      ),
      input: TextFormField(
        cursorColor: Theme.of(context).colorScheme.onPrimary,
        cursorWidth: 1,
        style: textFormFieldInputTextStyle(context),
        // other properties of the InputDecorator will be inherited from ThemeData.inputDecorationTheme
        decoration: const InputDecoration(
          labelText: 'Last name *',
        ),
      ),
      onSaved: () {},
      onCancelled: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  ToolUserLastnameEditorDialogModel viewModelBuilder(BuildContext context) => ToolUserLastnameEditorDialogModel();
}
