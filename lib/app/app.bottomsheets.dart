// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/tool_creator/tool_creator_sheet.dart';
import '../ui/bottom_sheets/tool_user_creator/tool_user_creator_sheet.dart';

enum BottomSheetType {
  notice,
  toolCreator,
  toolUserCreator,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.toolCreator: (context, request, completer) =>
        ToolCreatorSheet(request: request, completer: completer),
    BottomSheetType.toolUserCreator: (context, request, completer) =>
        ToolUserCreatorSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
