import 'package:flutter/material.dart';
import 'package:tools_rental_management/main.dart';

// this is the style for the input text for TextFormField
TextStyle? textFormFieldInputTextStyle(BuildContext context) {
  return switch (MyApp.of(context).themeMode) {
    ThemeMode.light => Theme.of(context).typography.white.bodySmall,
    ThemeMode.dark => Theme.of(context).typography.black.bodySmall,
    _ => throw 'configure ThemeMode.system',
  };
}
