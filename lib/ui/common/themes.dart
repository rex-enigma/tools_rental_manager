import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
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
    white: _textTheme,
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
    size: 30.0,
  ),

  ///duplicate this to the dark theme
  tabBarTheme: _tabBarTheme,
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
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
    black: _textTheme.copyWith(
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
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color.fromRGBO(228, 228, 228, 1.0),
    size: 30.0,
  ),
  tabBarTheme: _tabBarTheme,
);

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
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

TabBarTheme _tabBarTheme = const TabBarTheme(
  indicator: UnderlineTabIndicator(
    insets: EdgeInsets.symmetric(horizontal: 0.0),
    borderSide: BorderSide(
      color: Color.fromRGBO(57, 190, 219, 1.0),
      width: 4.0,
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(6.0),
      topRight: Radius.circular(6.0),
    ),
  ),
  indicatorSize: TabBarIndicatorSize.label,
);
