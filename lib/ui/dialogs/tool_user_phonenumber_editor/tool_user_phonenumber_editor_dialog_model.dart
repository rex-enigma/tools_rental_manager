import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ToolUserPhonenumberEditorDialogModel extends BaseViewModel {
  final TextEditingController phoneNumberEditingController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

// just make sure the input for the first or last name for the tool user is not empty
  String? validateToolUserPhoneNumber(String? text) {
    if (text == null) {
      return null;
    } else if (text.isEmpty) {
      return 'please input phone number';
      // if the text does't start with 07 or 011 return a error text requesting the user to use those values when starting a phone number
    } else if (!text.contains(RegExp(r'^(07|011)'))) {
      return "start with: '07' or '011'";
    }
    return null;
  }
}
