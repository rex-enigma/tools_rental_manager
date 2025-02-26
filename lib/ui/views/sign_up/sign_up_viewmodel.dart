import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:tools_rental_management/app/app.snackbars.dart';
import 'package:tools_rental_management/domain/entities/user_entity.dart';
import 'package:tools_rental_management/domain/usecases/sign_up_usecase.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class SignUpViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final UseCase<void, AccountParams> _signUpUseCase;

  SignUpViewModel({NavigationService? navigationService, SnackbarService? snackbarService, UseCase<void, AccountParams>? signUpUseCase})
      : _navigationService = navigationService ?? locator<NavigationService>(),
        _snackbarService = snackbarService ?? locator<SnackbarService>(),
        _signUpUseCase = signUpUseCase ?? locator<SignUpUseCase>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();
  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    rebuildUi();
  }

  void signUp() async {
    try {
      await _signUpUseCase(AccountParams(username: userNameTextEditingController.text, password: userNameTextEditingController.text));
      _snackbarService.showCustomSnackBar(message: 'Registered successful', variant: SnackbarType.success);
      _navigationService.clearStackAndShow(Routes.homeView);
    } catch (e) {
      print(e);
      _snackbarService.showCustomSnackBar(message: 'An account using this username already exist', variant: SnackbarType.error);
    }
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
