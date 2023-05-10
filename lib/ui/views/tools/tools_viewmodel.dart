import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/ui/bottom_sheets/tool_creator/tool_creator_sheet.dart';

class ToolsViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  void showBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.toolCreator,
      data: 'my passed data',
    );
    print(response?.data);
  }
}
