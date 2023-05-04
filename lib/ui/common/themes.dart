import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Color.fromRGBO(57, 190, 219, 1.0),
    onSecondary: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    scrim: Color.fromRGBO(36, 36, 36, 63.0),
  ),
  disabledColor: const Color.fromRGBO(228, 228, 228, 1.0),
  dividerColor: const Color.fromRGBO(228, 228, 228, 1.0),
  typography: Typography(
    white: textTheme,
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromRGBO(21, 21, 21, 1.0),
    onPrimary: Color.fromRGBO(228, 228, 228, 1.0),
    secondary: Color.fromRGBO(57, 190, 219, 1.0),
    onSecondary: Color.fromRGBO(228, 228, 228, 1.0),
    background: Color.fromRGBO(21, 21, 21, 1.0),
    onBackground: Color.fromRGBO(228, 228, 228, 1.0),
    error: Colors.red,
    onError: Color.fromRGBO(228, 228, 228, 1.0),
    surface: Color.fromRGBO(228, 228, 228, 1.0),
    onSurface: Color.fromRGBO(21, 21, 21, 1.0),
    scrim: Color.fromRGBO(36, 36, 36, 63.0),
  ),
  disabledColor: const Color.fromRGBO(228, 228, 228, 0.5),
  dividerColor: const Color.fromRGBO(228, 228, 228, 1.0),
  typography: Typography(
    black: textTheme,
  ),
);

TextTheme textTheme = const TextTheme(
  bodySmall: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  ),
  bodyMedium: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w500,
  ),
  titleMedium: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  ),
);
