import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:tools_rental_management/app/app.snackbars.dart';
import 'package:tools_rental_management/domain/entities/user_entity.dart';
import 'package:tools_rental_management/domain/usecases/login_usecase.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final UseCase<UserEntity?, AccountParams> _loginUseCase;

  LoginViewModel({NavigationService? navigationService, SnackbarService? snackbarService, UseCase<UserEntity?, AccountParams>? loginUseCase})
      : _navigationService = navigationService ?? locator<NavigationService>(),
        _snackbarService = snackbarService ?? locator<SnackbarService>(),
        _loginUseCase = loginUseCase ?? locator<LoginUseCase>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();
  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    rebuildUi();
  }

  void login() async {
    try {
      await _loginUseCase(AccountParams(username: userNameTextEditingController.text, password: passwordTextEditingController.text));
      _snackbarService.showCustomSnackBar(message: 'Login successful', variant: SnackbarType.success);
      _navigationService.replaceWithHomeView();
    } catch (e) {
      _snackbarService.showCustomSnackBar(message: 'Incorrect username or password', variant: SnackbarType.error);
    }
  }

  void navigateToSignUpView() {
    _navigationService.navigateToSignUpView();
  }
}

class LoginValidators {
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
