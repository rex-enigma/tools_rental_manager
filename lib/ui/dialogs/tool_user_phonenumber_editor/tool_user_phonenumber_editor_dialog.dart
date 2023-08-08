import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/ui/common/app_colors.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/edit_dialog.dart';

import '../../reusable_widgets/input_text_style.dart';
import 'tool_user_phonenumber_editor_dialog_model.dart';

const double _graphicSize = 60;

class ToolUserPhonenumberEditorDialog
    extends StackedView<ToolUserPhonenumberEditorDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ToolUserPhonenumberEditorDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolUserPhonenumberEditorDialogModel viewModel,
    Widget? child,
  ) {
    return EditDialog(
      title: Text(
        'Edit tool user phone number',
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
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        // other properties of the InputDecorator will be inherited from ThemeData.inputDecorationTheme
        decoration: const InputDecoration(
          labelText: 'Phone number*',
        ),
      ),
      onSaved: () {},
      onCancelled: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  ToolUserPhonenumberEditorDialogModel viewModelBuilder(BuildContext context) =>
      ToolUserPhonenumberEditorDialogModel();
}
