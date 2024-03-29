// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/image_capture/image_capture_sheet.dart';
import '../ui/bottom_sheets/more_tool_info/more_tool_info_sheet.dart';
import '../ui/bottom_sheets/select_tool/select_tool_sheet.dart';
import '../ui/bottom_sheets/tool_creator/tool_creator_sheet.dart';
import '../ui/bottom_sheets/tool_user_creator/tool_user_creator_sheet.dart';

enum BottomSheetType {
  imageCapture,
  toolCreator,
  toolUserCreator,
  selectTool,
  moreToolInfo,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.imageCapture: (context, request, completer) =>
        ImageCaptureSheet(request: request, completer: completer),
    BottomSheetType.toolCreator: (context, request, completer) =>
        ToolCreatorSheet(request: request, completer: completer),
    BottomSheetType.toolUserCreator: (context, request, completer) =>
        ToolUserCreatorSheet(request: request, completer: completer),
    BottomSheetType.selectTool: (context, request, completer) =>
        SelectToolSheet(request: request, completer: completer),
    BottomSheetType.moreToolInfo: (context, request, completer) =>
        MoreToolInfoSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
