import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/enums/national_id_side.dart';

class ToolUserCreatorSheetModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
    if (text == null) {
      return null;
    } else if (text.isEmpty) {
      return "please enter the tool user's phone number ";
    }
  }
}
