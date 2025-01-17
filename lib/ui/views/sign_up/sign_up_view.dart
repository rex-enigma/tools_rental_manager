import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/enums/account.dart';
import 'package:tools_rental_management/ui/reusable_widgets/login_sign_up_layout.dart';

import 'sign_up_viewmodel.dart';

class SignUpView extends StackedView<SignUpViewModel> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, SignUpViewModel viewModel, Widget? child) {
    return LoginSignUpLayout(
        title: Account.signUp,
        formKey: viewModel.formKey,
        userNameController: viewModel.userNameTextEditingController,
        passwordController: viewModel.passwordTextEditingController,
        obscurePassword: viewModel.obscurePassword,
        onUserNameValidate: (username) =>
            SignUpValidators.validateUserName(username),
        onPasswordValidate: (password) =>
            SignUpValidators.validatePassword(password),
        onTogglePasswordVisibility: viewModel.togglePasswordVisibility,
        onNavigateBack: viewModel.navigateBackToLoginView,
        onSubmit: viewModel.signUp);
  }

  @override
  SignUpViewModel viewModelBuilder(BuildContext context) => SignUpViewModel();
}
