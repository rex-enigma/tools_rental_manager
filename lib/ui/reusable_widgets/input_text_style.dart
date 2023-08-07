import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/main.dart';

/// this is the style for the input text for TextFormField
TextStyle? textFormFieldInputTextStyle(BuildContext context) {
  return switch (getThemeManager(context).selectedThemeMode) {
    ThemeMode.light => Theme.of(context).typography.white.bodySmall,
    ThemeMode.dark => Theme.of(context).typography.black.bodySmall,
    _ => throw 'configure ThemeMode.system',
  };
}
