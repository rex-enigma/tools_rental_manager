import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

TextStyle? appBarTitleTestStyle(BuildContext context) {
  return switch (getThemeManager(context).selectedThemeMode) {
    ThemeMode.light => Theme.of(context).typography.white.bodyLarge,
    ThemeMode.dark => Theme.of(context).typography.black.bodyLarge,
    _ => throw 'configure ThemeMode.system',
  };
}
