import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/enums/account.dart';
import 'package:tools_rental_management/ui/reusable_widgets/login_sign_up_layout.dart';
import 'package:tools_rental_management/ui/views/sign_up/sign_up_viewmodel.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, LoginViewModel viewModel, Widget? child) {
    return LoginSignUpLayout(
      title: Account.login,
      formKey: viewModel.formKey,
      userNameController: viewModel.userNameTextEditingController,
      passwordController: viewModel.passwordTextEditingController,
      obscurePassword: viewModel.obscurePassword,
      onUserNameValidate: (username) => LoginValidators.validateUserName(username),
      onPasswordValidate: (password) => LoginValidators.validatePassword(password),
      onRegister: viewModel.navigateToSignUpView,
      onTogglePasswordVisibility: viewModel.togglePasswordVisibility,
      onSubmit: viewModel.login,
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();

  @override
  void onDispose(LoginViewModel viewModel) {
    viewModel.userNameTextEditingController.dispose();
    viewModel.passwordTextEditingController.dispose();
    super.onDispose(viewModel);
  }
}
