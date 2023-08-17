import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ToolRateEditorDialogModel extends BaseViewModel {
  TextEditingController rateEditController = TextEditingController();

  void setRate(String rate) {
    rateEditController.text = rate;
  }
}
