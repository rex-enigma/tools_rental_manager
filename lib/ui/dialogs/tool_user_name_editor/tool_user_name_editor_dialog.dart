import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/edit_dialog_layout.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';

import 'tool_user_name_editor_dialog_model.dart';

class ToolUserNameEditorDialog
    extends StackedView<ToolUserNameEditorDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ToolUserNameEditorDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolUserNameEditorDialogModel viewModel,
    Widget? child,
  ) {
    return EditDialog(
      title: Text(
        request.title ?? 'Edit',
        style: switch (getThemeManager(context).selectedThemeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
          ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
          _ => throw ' configure ThemeMode.system',
        },
      ),
      input: Form(
        key: viewModel.formKey,
        child: TextFormField(
          controller: viewModel.nameEditingController,
          cursorColor: Theme.of(context).colorScheme.onPrimary,
          cursorWidth: 1,
          style: textFormFieldInputTextStyle(context),
          // other properties of the InputDecorator will be inherited from ThemeData.inputDecorationTheme
          decoration: InputDecoration(
            labelText: request.description ?? 'Edit',
          ),
          validator: (value) => viewModel.validateToolUserName(value),
        ),
      ),
      onSaved: () {
        if (viewModel.formKey.currentState!.validate()) {
          // return  the name that will be used to update the toolUser first or last name wrapped up by a DialogResponse
          completer(DialogResponse(data: viewModel.nameEditingController.text));
        }
      },
      onCancelled: () {
        completer(DialogResponse(data: null));
      },
    );
  }

  @override
  ToolUserNameEditorDialogModel viewModelBuilder(BuildContext context) =>
      ToolUserNameEditorDialogModel();

  @override
  void onViewModelReady(ToolUserNameEditorDialogModel viewModel) {
    // initialize the textController with the data gotten from the toolUserViewModel's show...Dialog function
    viewModel.nameEditingController.text = request.data;
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(ToolUserNameEditorDialogModel viewModel) {
    viewModel.nameEditingController.dispose();
    super.onDispose(viewModel);
  }
}
