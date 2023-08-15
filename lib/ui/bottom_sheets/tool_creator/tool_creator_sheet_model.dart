import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/enums/category.dart';

class ToolCreatorSheetModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();

  TextEditingController toolNameTextEditingController = TextEditingController();
  String? _toolImagePath;

  String? get toolImagePath => _toolImagePath;

  void showToolImageCaptureSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.toolImageCapture,
    );
  }

  // i had to pass context so that i can use showDatePicker functionality, since the stacked way for returning data using showCustomDialog doesn't work with DatePickerDialog
  void showDatePickerDialog(context) async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(3000),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    print(dateTime);
  }
}
