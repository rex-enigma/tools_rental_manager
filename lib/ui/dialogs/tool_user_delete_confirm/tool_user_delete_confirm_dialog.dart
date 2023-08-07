import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/ui/common/app_colors.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/confirm_dialog.dart';

import 'tool_user_delete_confirm_dialog_model.dart';

const double _graphicSize = 60;

class ToolUserDeleteConfirmDialog extends StackedView<ToolUserDeleteConfirmDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ToolUserDeleteConfirmDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolUserDeleteConfirmDialogModel viewModel,
    Widget? child,
  ) {
    return ConfirmDialog(
      // when called, will return true or false back to [DialogService.showCustomDialog] function which was used to add ToolUserDeleteConfirmDialog to the overlay stack of widgets.
      completer: completer,
      description: RichText(
        text: TextSpan(
          style: switch (getThemeManager(context).selectedThemeMode) {
            ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
            ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
            _ => throw ' configure ThemeMode.system',
          },
          children: const [
            TextSpan(text: 'Do you want to delete '),
            TextSpan(text: 'Mark dew', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  ToolUserDeleteConfirmDialogModel viewModelBuilder(BuildContext context) => ToolUserDeleteConfirmDialogModel();
}
