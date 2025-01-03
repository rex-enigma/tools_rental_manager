import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/confirm_dialog_layout.dart';

import 'delete_confirm_dialog_model.dart';

class DeleteConfirmDialog extends StackedView<DeleteConfirmDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DeleteConfirmDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeleteConfirmDialogModel viewModel,
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
          children: [
            const TextSpan(text: 'Do you want to delete '),
            TextSpan(
              text: request.data ??
                  " 'add the name of the item you want to delete' ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  DeleteConfirmDialogModel viewModelBuilder(BuildContext context) =>
      DeleteConfirmDialogModel();
}
