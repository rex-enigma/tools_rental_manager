import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/enums/status.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/edit_dialog_layout.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';

import 'tool_status_editor_dialog_model.dart';

const double _graphicSize = 60;

class ToolStatusEditorDialog extends StackedView<ToolStatusEditorDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ToolStatusEditorDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolStatusEditorDialogModel viewModel,
    Widget? child,
  ) {
    return EditDialog(
      title: Text(
        'Edit tool status',
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
          labelText: 'Status *',
        ),
        items: Status.values.map(
          (status) {
            var isBeingUsed = status == Status.beingUsed ? true : false;
            return DropdownMenuItem(
              value: status.name,
              child: Text(
                status.name,
                style: TextStyle(
                    color: isBeingUsed == true
                        ? Theme.of(context).disabledColor
                        : null),
              ),
              // if the status is Status.beingUsed   we disable DropdownMenuItem for the item beingUsed
              enabled: !isBeingUsed,
            );
          },
        ).toList(),
        onChanged: (value) => {},
      ),
      onSaved: () {},
      onCancelled: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  ToolStatusEditorDialogModel viewModelBuilder(BuildContext context) =>
      ToolStatusEditorDialogModel();
}
