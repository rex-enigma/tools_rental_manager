import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.locator.dart';

enum SnackbarType {
  success,
  error,
}

void setupSnackbarUi() {
  final snackbarService = locator<SnackbarService>();

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: const Color.fromRGBO(57, 190, 219, 1.0),
      icon: const Icon(Icons.check_circle),
      shouldIconPulse: false,
      maxWidth: 340.0,
      borderRadius: 6.0,
    ),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      icon: const Icon(Icons.cancel),
      shouldIconPulse: false,
      maxWidth: 340.0,
      borderRadius: 6.0,
    ),
  );
}
