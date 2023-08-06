import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';

class ToolUsersViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  // its hea to testing purposes delete after use
  final _dialogService = locator<DialogService>();

  void showUserCreatorBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.toolUserCreator,
      isScrollControlled: true,
      // setting it to false will make sure if you use [SafeArea] when constructing bottomSheet, it won't be ignored.
      ignoreSafeArea: false,
    );

    print(response?.data);
  }

  // this is here to test different dialogs. Delete after finishing testing.
  void showDialog() async {
    var response = await _dialogService.showCustomDialog(
        variant: DialogType.toolUserDeleteConfirm);

    print(response?.confirmed);
  }
}
