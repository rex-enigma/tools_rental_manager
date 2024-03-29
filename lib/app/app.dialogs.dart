// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/delete_confirm/delete_confirm_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/tool_category_editor/tool_category_editor_dialog.dart';
import '../ui/dialogs/tool_rate_editor/tool_rate_editor_dialog.dart';
import '../ui/dialogs/tool_repossession_confirm/tool_repossession_confirm_dialog.dart';
import '../ui/dialogs/tool_status_editor/tool_status_editor_dialog.dart';
import '../ui/dialogs/tool_user_name_editor/tool_user_name_editor_dialog.dart';
import '../ui/dialogs/tool_user_phonenumber_editor/tool_user_phonenumber_editor_dialog.dart';

enum DialogType {
  infoAlert,
  toolRateEditor,
  toolCategoryEditor,
  toolStatusEditor,
  toolUserPhonenumberEditor,
  toolRepossessionConfirm,
  deleteConfirm,
  toolUserNameEditor,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.toolRateEditor: (context, request, completer) =>
        ToolRateEditorDialog(request: request, completer: completer),
    DialogType.toolCategoryEditor: (context, request, completer) =>
        ToolCategoryEditorDialog(request: request, completer: completer),
    DialogType.toolStatusEditor: (context, request, completer) =>
        ToolStatusEditorDialog(request: request, completer: completer),
    DialogType.toolUserPhonenumberEditor: (context, request, completer) =>
        ToolUserPhonenumberEditorDialog(request: request, completer: completer),
    DialogType.toolRepossessionConfirm: (context, request, completer) =>
        ToolRepossessionConfirmDialog(request: request, completer: completer),
    DialogType.deleteConfirm: (context, request, completer) =>
        DeleteConfirmDialog(request: request, completer: completer),
    DialogType.toolUserNameEditor: (context, request, completer) =>
        ToolUserNameEditorDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
