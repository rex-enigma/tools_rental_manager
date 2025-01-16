import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/enums/account.dart';
import 'package:tools_rental_management/ui/reusable_widgets/login_sign_up_layout.dart';

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
        isPasswordVisible: viewModel.isPasswordVisible,
        onTogglePasswordVisibility: viewModel.togglePasswordVisibility,
        onSubmit: viewModel.submitForm);
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
