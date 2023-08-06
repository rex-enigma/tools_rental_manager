// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/tool_category_editor/tool_category_editor_dialog.dart';
import '../ui/dialogs/tool_delete_confirm/tool_delete_confirm_dialog.dart';
import '../ui/dialogs/tool_disassociate_confirm/tool_disassociate_confirm_dialog.dart';
import '../ui/dialogs/tool_rate_editor/tool_rate_editor_dialog.dart';
import '../ui/dialogs/tool_status_editor/tool_status_editor_dialog.dart';
import '../ui/dialogs/tool_user_delete_confirm/tool_user_delete_confirm_dialog.dart';
import '../ui/dialogs/tool_user_firstname_editor/tool_user_firstname_editor_dialog.dart';
import '../ui/dialogs/tool_user_lastname_editor/tool_user_lastname_editor_dialog.dart';
import '../ui/dialogs/tool_user_phonenumber_editor/tool_user_phonenumber_editor_dialog.dart';

enum DialogType {
  infoAlert,
  toolRateEditor,
  toolCategoryEditor,
  toolStatusEditor,
  toolUserFirstnameEditor,
  toolUserLastnameEditor,
  toolUserPhonenumberEditor,
  toolDisassociateConfirm,
  toolUserDeleteConfirm,
  toolDeleteConfirm,
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
    DialogType.toolUserFirstnameEditor: (context, request, completer) =>
        ToolUserFirstnameEditorDialog(request: request, completer: completer),
    DialogType.toolUserLastnameEditor: (context, request, completer) =>
        ToolUserLastnameEditorDialog(request: request, completer: completer),
    DialogType.toolUserPhonenumberEditor: (context, request, completer) =>
        ToolUserPhonenumberEditorDialog(request: request, completer: completer),
    DialogType.toolDisassociateConfirm: (context, request, completer) =>
        ToolDisassociateConfirmDialog(request: request, completer: completer),
    DialogType.toolUserDeleteConfirm: (context, request, completer) =>
        ToolUserDeleteConfirmDialog(request: request, completer: completer),
    DialogType.toolDeleteConfirm: (context, request, completer) =>
        ToolDeleteConfirmDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
