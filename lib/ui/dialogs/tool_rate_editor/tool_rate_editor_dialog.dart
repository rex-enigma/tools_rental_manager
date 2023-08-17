import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/edit_dialog_layout.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';

import 'tool_rate_editor_dialog_model.dart';

class ToolRateEditorDialog extends StackedView<ToolRateEditorDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ToolRateEditorDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolRateEditorDialogModel viewModel,
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
      input: TextFormField(
        controller: viewModel.rateEditController,
        cursorColor: Theme.of(context).colorScheme.onPrimary,
        cursorWidth: 1,
        style: textFormFieldInputTextStyle(context),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        // other properties of the InputDecorator will be inherited from ThemeData.inputDecorationTheme
        decoration: const InputDecoration(
          labelText: 'Rate (KES) *', // don't forget to make the KES dynamic.
        ),
        onChanged: (value) {
          if (value == '') {
            viewModel.rateEditController.text = '0';
            return;
          }
        },
      ),
      onSaved: () {
        // make sure you return rate as integer
        completer(DialogResponse(data: int.parse(viewModel.rateEditController.text)));
      },
      onCancelled: () {
        completer(DialogResponse(data: null));
      },
    );
  }

  @override
  ToolRateEditorDialogModel viewModelBuilder(BuildContext context) => ToolRateEditorDialogModel();

  @override
  void onViewModelReady(ToolRateEditorDialogModel viewModel) {
    viewModel.rateEditController.text = request.data.toString();
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(ToolRateEditorDialogModel viewModel) {
    viewModel.rateEditController.dispose();
    super.onDispose(viewModel);
  }
}
