import 'package:flutter/material.dart';
import 'package:tools_rental_management/ui/common/app_colors.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

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
    return const AlertDialog(
      title: Text('Edit tool category'),
    );
  }

  @override
  ToolCategoryEditorDialogModel viewModelBuilder(BuildContext context) =>
      ToolCategoryEditorDialogModel();
}
