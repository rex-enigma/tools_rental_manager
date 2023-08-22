import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/enums/status.dart';

// green const Color.fromRGBO(109, 211, 47, 1),
// orange const Color.fromRGBO(211, 175, 47, 1)
// red const Color.fromRGBO(211, 47, 47, 1),
// blue const Color.fromRGBO(47, 113, 211, 1),

/// text style for a customListTile's subtitle last substring
/// the second argument will be used to decide the color codes of the substring
TextStyle subtitleLastSubStringTextStyle(BuildContext context,
    {Status? status}) {
  // decide the color code for a single substring text when toolStatus is not null
  Color? color = switch (status) {
    Status.beingUsed => Color.fromARGB(255, 212, 193, 122),
    Status.idle => Color.fromARGB(255, 158, 201, 132),
    Status.retired => Color.fromARGB(255, 219, 122, 122),
    Status.underMaintenance => Color.fromARGB(255, 120, 156, 209),
    null => null,
  };

  return switch (getThemeManager(context).selectedThemeMode) {
    ThemeMode.light => Theme.of(context)
        .typography
        .white
        .bodySmall!
        .copyWith(fontWeight: FontWeight.bold, color: color),
    ThemeMode.dark => Theme.of(context)
        .typography
        .black
        .bodySmall!
        .copyWith(fontWeight: FontWeight.bold, color: color),
    _ => throw ' configure ThemeMode.system',
  };
}

TextStyle subtitleFirstSubStringTextStyle(BuildContext context) {
  return switch (getThemeManager(context).selectedThemeMode) {
    ThemeMode.light => Theme.of(context).typography.white.bodySmall!,
    ThemeMode.dark => Theme.of(context).typography.black.bodySmall!,
    _ => throw ' configure ThemeMode.system',
  };
}

/// [displayFontSizeMedium] if true, display a predefined  fontSize = 18.0 on the title
TextStyle? appBarTitleTextStyle(context, {bool displayFontSizeMedium = false}) {
  return displayFontSizeMedium
      ? switch (getThemeManager(context).selectedThemeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodyMedium,
          ThemeMode.dark => Theme.of(context).typography.black.bodyMedium,
          _ => throw 'configure ThemeMode.system',
        }
      : switch (getThemeManager(context).selectedThemeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodyLarge,
          ThemeMode.dark => Theme.of(context).typography.black.bodyLarge,
          _ => throw 'configure ThemeMode.system',
        };
}

/// this is the style for the input text for TextFormField
TextStyle? textFormFieldInputTextStyle(BuildContext context) {
  return switch (getThemeManager(context).selectedThemeMode) {
    ThemeMode.light => Theme.of(context).typography.white.bodySmall,
    ThemeMode.dark => Theme.of(context).typography.black.bodySmall,
    _ => throw 'configure ThemeMode.system',
  };
}

/// container background color for a selected tool in SelectedToolSheet or ToolUserView
Color? selectedToolBackGroundColor(context) {
  return switch (getThemeManager(context).selectedThemeMode) {
    ThemeMode.light => const Color.fromARGB(239, 226, 229, 229),
    ThemeMode.dark => const Color.fromARGB(96, 76, 78, 78),
    _ => throw ' configure ThemeMode.system',
  };
}
