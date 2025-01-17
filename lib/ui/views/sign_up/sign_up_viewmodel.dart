import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';

class SignUpViewModel extends BaseViewModel {
  final NavigationService _navigationService;

  SignUpViewModel({NavigationService? navigationService})
      : _navigationService = navigationService ?? locator<NavigationService>();

  final SnackbarService _snackbackService = SnackbarService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    rebuildUi();
  }

  void signUp() {
    // should call the sign up use case to provide the logic to sign up.
    // the below implementation is just for testing
    //_navigationService.replaceWithHomeView();
    //_snackbackService.showCustomSnackBar(message: message, variant: variant)
  }

  void navigateBackToLoginView() {
    _navigationService.back();
  }
}

class SignUpValidators {
  static String? validateUserName(String? username) {
    if (username == null) {
      return null;
    } else if (username.isEmpty) {
      return 'please enter a user name';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null) {
      return null;
    } else if (password.isEmpty) {
      return 'please enter a password';
    }
    return null;
  }
}
