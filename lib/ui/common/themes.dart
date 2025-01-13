import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Color.fromRGBO(57, 190, 219, 1.0),
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    scrim: Color.fromRGBO(36, 36, 36, 63.0),
  ),
  disabledColor: const Color.fromRGBO(228, 228, 228, 1.0),
  dividerColor: const Color.fromRGBO(228, 228, 228, 1.0),
  typography: Typography(
    white: _textTheme,
    black: _textThemeBlack,
  ),
  filledButtonTheme: const FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(
        Color.fromRGBO(57, 190, 219, 1.0),
      ),
      foregroundColor: WidgetStatePropertyAll(
        Colors.white,
      ),
      fixedSize: WidgetStatePropertyAll(
        Size(140.0, 50.0),
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
    size: 30.0,
  ),
  tabBarTheme: _tabBarTheme,
  outlinedButtonTheme: _outlinedButtonTheme,
  inputDecorationTheme: _inputDecorationThemeLight,
  datePickerTheme: datePickerThemeData,
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromRGBO(21, 21, 21, 1.0),
    onPrimary: Color.fromRGBO(228, 228, 228, 1.0),
    secondary: Color.fromRGBO(57, 190, 219, 1.0),
    onSecondary: Color.fromRGBO(228, 228, 228, 1.0),
    error: Colors.red,
    onError: Color.fromRGBO(228, 228, 228, 1.0),
    surface: Color.fromRGBO(21, 21, 21, 1.0),
    onSurface: Color.fromRGBO(228, 228, 228, 1.0),
    scrim: Color.fromRGBO(36, 36, 36, 63.0),
  ),
  disabledColor: const Color.fromRGBO(228, 228, 228, 0.5),
  dividerColor: const Color.fromRGBO(228, 228, 228, 1.0),
  typography: Typography(
    white: _textTheme,
    black: _textThemeBlack,
  ),
  filledButtonTheme: const FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(
        Color.fromRGBO(57, 190, 219, 1.0),
      ),
      foregroundColor: WidgetStatePropertyAll(
        Colors.black,
      ),
      fixedSize: WidgetStatePropertyAll(
        Size(140.0, 50.0),
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color.fromRGBO(228, 228, 228, 1.0),
    size: 30.0,
  ),
  tabBarTheme: _tabBarTheme,
  outlinedButtonTheme: _outlinedButtonTheme,
  inputDecorationTheme: _inputDecorationThemeDark,
  datePickerTheme: datePickerThemeData,
);

TextTheme _textThemeBlack = _textTheme.copyWith(
  bodySmall: _bodySmall.copyWith(
    color: const Color.fromRGBO(228, 228, 228, 1.0),
  ),
  bodyMedium: _bodyMedium.copyWith(
    color: const Color.fromRGBO(228, 228, 228, 1.0),
  ),
  bodyLarge: _bodyLarge.copyWith(
    color: const Color.fromRGBO(228, 228, 228, 1.0),
  ),
  titleMedium: _titleMedium.copyWith(
    color: const Color.fromRGBO(228, 228, 228, 1.0),
  ),
);

// this is textThemeWhite
TextTheme _textTheme = TextTheme(
  bodySmall: _bodySmall,
  bodyMedium: _bodyMedium,
  bodyLarge: _bodyLarge,
  titleMedium: _titleMedium,
);

TextStyle _bodySmall = const TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

TextStyle _bodyMedium = const TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
TextStyle _bodyLarge = const TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

TextStyle _titleMedium = const TextStyle(
  fontSize: 20.0, // was 18.0
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

TabBarTheme _tabBarTheme = const TabBarTheme(
  indicator: UnderlineTabIndicator(
    insets: EdgeInsets.symmetric(horizontal: 0.0),
    borderSide: BorderSide(
      color: Color.fromRGBO(57, 190, 219, 1.0),
      width: 2.0,
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(6.0),
      topRight: Radius.circular(6.0),
    ),
  ),
  indicatorSize: TabBarIndicatorSize.label,
);

OutlinedButtonThemeData _outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    foregroundColor: const Color.fromRGBO(57, 190, 219, 1.0),
    side: const BorderSide(
      color: Color.fromRGBO(57, 190, 219, 1.0),
    ),
    fixedSize: const Size(140.0, 50.0),
  ),
);

InputDecorationTheme _inputDecorationThemeLight = const InputDecorationTheme(
  isDense: true,
  focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
  enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
  disabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  focusedErrorBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  errorStyle: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
  hintStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
    overflow: TextOverflow.ellipsis,
  ),
  labelStyle: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    overflow: TextOverflow.ellipsis,
  ),
  floatingLabelStyle: TextStyle(color: Colors.black),
  floatingLabelBehavior: FloatingLabelBehavior.always,
);

InputDecorationTheme _inputDecorationThemeDark = const InputDecorationTheme(
  isDense: true,
  focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  disabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  focusedErrorBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  errorStyle: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
  hintStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
    overflow: TextOverflow.ellipsis,
  ),
  labelStyle: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    overflow: TextOverflow.ellipsis,
  ),
  floatingLabelStyle: TextStyle(color: Colors.white),
  floatingLabelBehavior: FloatingLabelBehavior.always,
);

DatePickerThemeData datePickerThemeData = const DatePickerThemeData(
  backgroundColor: Color.fromRGBO(171, 212, 221, 1),
  surfaceTintColor: Color.fromRGBO(57, 190, 219, 1.0),
);
