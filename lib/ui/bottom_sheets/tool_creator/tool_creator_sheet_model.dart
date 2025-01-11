import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:tools_rental_management/domain/entities/tool_entity.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/currency.dart';

class ToolCreatorSheetModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController toolNameTextEditingController = TextEditingController();
  // the date in held by text is formatted using intl package, don't forget to convert convert it back to DateTime when preparing it for storage
  TextEditingController purchaseDateTextEditController = TextEditingController();
  Currency? currency;
  TextEditingController purchasedPriceTextEditingController = TextEditingController();
  TextEditingController rateTextEditingController = TextEditingController();
  Category? category;
  // the id held by text is of type string, don't forget to convert it back to int type when preparing it for storage
  TextEditingController toolUniqueIdTextEditingController = TextEditingController();
  String? toolImagePath;

  void showToolImageCaptureSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      // title to be used for the ImageCaptureSheet
      title: 'Tool image',
      variant: BottomSheetType.imageCapture,
      // send the toolImagePath to the ImageCaptureSheet for it to be removed if the user has selected one and what to update with a new one
      data: toolImagePath,
    );

    // the returned value will be null or a string representing a path of a tool image
    toolImagePath = response?.data;
    rebuildUi();
  }

  void navigateToToolNamesView() async {
    String? response = await _navigationService.navigateToToolNamesView(null, false);
    if (response != null) toolNameTextEditingController.text = response;
    // no need to call rebuildUi() because text is a setter which when set/called will notify the listeners which will be our inputField in TextFormField for the tool name, hence it will rebuild showing the value which was set
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

    if (dateTime != null) {
      purchaseDateTextEditController.text = DateFormat('dd/MM/yyyy').format(dateTime);
    }
    // no need to call rebuildUi() because text is a setter which when set/called will notify the listeners which will be our inputField in TextFormField for the purchase date, hence it will rebuild showing the value which was set
  }

  void setCurrency(Currency? currency) {
    this.currency = currency;
  }

  void setCategory(Category? category) {
    this.category = category;
  }

  void generateToolUniqueId() {
    int toolUniqueId = generateUniqueToolId();
    // convert the id to string so that we can set the toolUniqueIdTextEditingController with it
    String strToolUniqueId = toolUniqueId.toString();
    // no need to call rebuildUi() because when text is set it will notify the inputField wrapped by the TextFormField hence rebuild which will display the value
    toolUniqueIdTextEditingController.text = strToolUniqueId;
  }

  /// its called when all forms validation pass
  void submitForm() {
    ToolEntity newTool = ToolEntity.insert(
      name: toolNameTextEditingController.text,
      boughtAt: DateFormat('dd/MM/yyyy').parse(purchaseDateTextEditController.text),
      purchasedPrice: int.parse(purchasedPriceTextEditingController.text),
      rate: int.parse(rateTextEditingController.text),
      currency: currency!, // we guaranty the currency cant be null because it has already been validate not to be null
      category: category!, // we guaranty the category cant be null because it has already been validated not to be null
      toolImagePath: toolImagePath!,
      toolUniqueId: int.parse(toolUniqueIdTextEditingController.text),
    );

    // send this newTool back to ToolsView for it to be added to the database
    // it must be wrapped in SheetResponse for it to be accessed
    _navigationService.back(result: SheetResponse(data: newTool));
  }
}

// this function might return identical values
// an using it just because the app is a prototype
int generateUniqueToolId() {
  int fixValue = 51928347;
  int randomValue = Random().nextInt(100);
  return fixValue * randomValue;
}

class ToolCreatorSheetValidators {
  static String? validateToolName(String? text) {
    if (text == null) {
      return null;
    } else if (text.isEmpty) {
      return 'tap and pick a tool name';
    }
    return null;
  }

  static String? validatePurchaseDate(String? text) {
    if (text == null) {
      return null;
    } else if (text.isEmpty) {
      return 'tap and pick a purchase date';
    }
    return null;
  }

  static String? validateCurrency(Currency? currency) {
    if (currency == null) {
      return 'choose the currency used to purchase the tool';
    }
    return null;
  }

  static String? validatePurchasePriceInput(String? text) {
    if (text == null) {
      return null;
    } else if (text.contains(RegExp(r'[a-zA-Z]'))) {
      return 'no letters are allowed';
    } else if (text.isEmpty) {
      return 'please input a purchase value';
    }
    return null;
  }

  static String? validateRate(String? text) {
    if (text == null) {
      return null;
    } else if (text.contains(RegExp(r'[a-zA-Z]'))) {
      return 'no letters are allowed';
    } else if (text.isEmpty) {
      return 'please input a rate value';
    }
    return null;
  }

  static String? validateCategory(Category? category) {
    if (category == null) {
      return 'choose in which category a tool is in';
    }
    return null;
  }

  static String? validateToolUniqueId(String? text) {
    if (text == null) {
      return null;
    } else if (text.isEmpty) {
      return "tap 'Gen id' to generate a tool id";
    }
    return null;
  }
}
