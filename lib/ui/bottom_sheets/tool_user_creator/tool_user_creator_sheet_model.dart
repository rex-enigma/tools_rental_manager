import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/data_models/tooluser.dart';
import 'package:tools_rental_management/enums/national_id_side.dart';

class ToolUserCreatorSheetModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // no need to call rebuildUi() because the text in these controllers are setters which when set/called will notify the listeners which will be our inputField in TextFormField for the firstName/lastName/phoneNumber, hence it will rebuild showing the value which was set
  TextEditingController firstNameTextEditingController = TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController = TextEditingController();
  String? frontNationalIdImagePath;
  String? backNationalIdImagePath;
  String? userImagePath;

  void showNationalIdImageCaptureSheet(NationalIdSide nationalIdSide) async {
    var response = await _bottomSheetService.showCustomSheet(
      // title to be used for the ImageCaptureSheet
      title: 'National id image',
      variant: BottomSheetType.imageCapture,
      // send the frontNationalIdImagePath or backNationalIdImagePath to the NationalIdImageCaptureSheet for it to be removed if the user has selected one and what to update with a new one
      data: switch (nationalIdSide) {
        NationalIdSide.front => frontNationalIdImagePath,
        NationalIdSide.back => backNationalIdImagePath,
      },
    );

    // only set frontNationalIdImagePath or backNationalIdImagePath if response.data returned in non-null
    // meaning the user as capture/selected an image
    if (response?.data != null) {
      // we are using switch here to distinguish when setting either frontNationalIdImagePath or backNationalIdImagePath
      switch (nationalIdSide) {
        case NationalIdSide.front:
          frontNationalIdImagePath = response!.data;
          break;
        case NationalIdSide.back:
          backNationalIdImagePath = response!.data;
          break;
      }
    }

    rebuildUi();
  }

  void showToolUserImageCaptureSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      // title to be used for the ImageCaptureSheet
      title: 'Tool user image',
      variant: BottomSheetType.imageCapture,
      // send the userImagePath to the ImageCaptureSheet for it to be removed if the user has selected one and what to update with a new one
      data: userImagePath,
    );

    if (response?.data != null) {
      userImagePath = response!.data;
    }
    rebuildUi();
  }

  // will be called when all the forms are valid
  void submitForm() {
    print(phoneNumberTextEditingController.text);
    ToolUser newToolUser = ToolUser.insert(
      firstName: firstNameTextEditingController.text,
      lastName: lastNameTextEditingController.text,
      frontNationalIdImagePath: frontNationalIdImagePath!,
      backNationalIdImagePath: backNationalIdImagePath!,
      avatarImagePath: userImagePath!,
      phoneNumber: int.parse(phoneNumberTextEditingController.text),
      // hardcoded this value to kenya's callingCode, myb will be sent dynamic later if we provide that input to the user
      countryCallingCode: 254,
    );

    // send this newToolUser back to ToolUsersView for it to be added to the database
    // it must be wrapped in SheetResponse for it to be accessed
    _navigationService.back(result: SheetResponse(data: newToolUser));
  }
}

class ToolUserCreatorSheetValidators {
  static String? validateToolUserFirstName(String? text) {
    if (text == null) {
      return null;
    } else if (text.isEmpty) {
      return "please enter the tool user's first name ";
    }
  }

  static String? validateToolUserLastName(String? text) {
    if (text == null) {
      return null;
    } else if (text.isEmpty) {
      return "please enter the tool user's last name ";
    }
  }

  static String? validateToolUserPhoneNumber(String? text) {
    print(text);
    if (text == null) {
      return null;
    } else if (text.isEmpty) {
      return "please enter the tool user's phone number ";
    }
  }
}
