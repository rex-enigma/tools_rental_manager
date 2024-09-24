import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ToolUserNameEditorDialogModel extends BaseViewModel {
  final TextEditingController nameEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

// just make sure the input for the first or last name for the tool user is not empty
  String? validateToolUserName(String? text) {
    if (text == null) {
      return null;
    } else if (text.isEmpty) {
      return 'please input name';
    }
    return null;
  }
}
