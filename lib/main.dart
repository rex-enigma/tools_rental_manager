import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:tools_rental_management/app/app.snackbars.dart';
import 'package:tools_rental_management/ui/common/themes.dart';

Future main() async {
  await ThemeManager.initialise();
  await setupLocator();
  setupSnackbarUi();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>() as _MyAppState;
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.light,
      lightTheme: lightTheme,
      darkTheme: darkTheme,
      builder: (context, lightTheme, darkTheme, themeMode) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'tools rental manager',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
      ),
    );
  }
}
