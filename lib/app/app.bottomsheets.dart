// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/more_tool_info/more_tool_info_sheet.dart';
import '../ui/bottom_sheets/national_id_image_capture/national_id_image_capture_sheet.dart';
import '../ui/bottom_sheets/select_tool/select_tool_sheet.dart';
import '../ui/bottom_sheets/tool_creator/tool_creator_sheet.dart';
import '../ui/bottom_sheets/tool_image_capture/tool_image_capture_sheet.dart';
import '../ui/bottom_sheets/tool_user_creator/tool_user_creator_sheet.dart';
import '../ui/bottom_sheets/tool_user_image_capture/tool_user_image_capture_sheet.dart';

enum BottomSheetType {
  toolCreator,
  toolUserCreator,
  toolImageCapture,
  toolUserImageCapture,
  nationalIdImageCapture,
  selectTool,
  moreToolInfo,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.toolCreator: (context, request, completer) =>
        ToolCreatorSheet(request: request, completer: completer),
    BottomSheetType.toolUserCreator: (context, request, completer) =>
        ToolUserCreatorSheet(request: request, completer: completer),
    BottomSheetType.toolImageCapture: (context, request, completer) =>
        ToolImageCaptureSheet(request: request, completer: completer),
    BottomSheetType.toolUserImageCapture: (context, request, completer) =>
        ToolUserImageCaptureSheet(request: request, completer: completer),
    BottomSheetType.nationalIdImageCapture: (context, request, completer) =>
        NationalIdImageCaptureSheet(request: request, completer: completer),
    BottomSheetType.selectTool: (context, request, completer) =>
        SelectToolSheet(request: request, completer: completer),
    BottomSheetType.moreToolInfo: (context, request, completer) =>
        MoreToolInfoSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
