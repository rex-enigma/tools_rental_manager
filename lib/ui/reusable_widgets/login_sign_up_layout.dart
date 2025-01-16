import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/assets/font_icons/font_icons.dart';
import 'package:tools_rental_management/enums/account.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';

class LoginSignUpLayout extends StatelessWidget {
  // is used for identifying Account.login or Account.signup screen.
  final Account title;
  final GlobalKey<FormState> formKey;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final bool isPasswordVisible;
  final VoidCallback? onNavigateBack;
  final VoidCallback? onRegister;
  final String? Function(String?)? onUserNameValidate;
  final String? Function(String?)? onPasswordValidate;
  final VoidCallback onTogglePasswordVisibility;
  final VoidCallback onSubmit;

  const LoginSignUpLayout(
      {required this.title,
      required this.formKey,
      required this.userNameController,
      required this.passwordController,
      required this.isPasswordVisible,
      this.onNavigateBack,
      this.onRegister,
      this.onUserNameValidate,
      this.onPasswordValidate,
      required this.onTogglePasswordVisibility,
      required this.onSubmit,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.unfocus(); // Unfocus the currently focused TextFormField
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          leading: title == Account.signUp
              ? IconButton(
                  onPressed: onNavigateBack,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  color: Theme.of(context).colorScheme.onPrimary,
                )
              : null,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 30.0,
              children: [
                Icon(
                  FontIcons.gearHelmet,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 100,
                ),
                Text(
                  title.name.toUpperCase(),
                  style: switch (getThemeManager(context).selectedThemeMode) {
                    ThemeMode.light => Theme.of(context).typography.white.bodyLarge!,
                    ThemeMode.dark => Theme.of(context).typography.black.bodyLarge!,
                    _ => throw ' configure ThemeMode.system',
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 36.0,
                    right: 36.0,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 30.0,
                      children: [
                        TextFormField(
                          controller: userNameController,
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          cursorWidth: 1,
                          keyboardType: TextInputType.name,
                          style: textFormFieldInputTextStyle(context),
                          decoration: InputDecoration(
                            labelText: 'Username',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                            prefixIcon: const Icon(Icons.person),
                            prefixIconColor: Theme.of(context).colorScheme.secondary,
                          ),
                          validator: onUserNameValidate,
                        ),
                        TextFormField(
                          controller: passwordController,
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          cursorWidth: 1,
                          keyboardType: TextInputType.text,
                          obscureText: isPasswordVisible,
                          style: textFormFieldInputTextStyle(context),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                            prefixIcon: const Icon(Icons.lock),
                            prefixIconColor: Theme.of(context).colorScheme.secondary,
                            suffixIcon: IconButton(
                              onPressed: onTogglePasswordVisibility,
                              icon: isPasswordVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                            ),
                            suffixIconColor: Theme.of(context).colorScheme.onPrimary,
                          ),
                          validator: onPasswordValidate,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                onSubmit();
                              }
                            },
                            child: Text(
                              title == Account.login ? 'Login' : 'Sign up',
                              style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpaceExtraLarge,
                if (title == Account.login)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: switch (getThemeManager(context).selectedThemeMode) {
                          ThemeMode.light => Theme.of(context).typography.white.bodySmall!,
                          ThemeMode.dark => Theme.of(context).typography.black.bodySmall!,
                          _ => throw ' configure ThemeMode.system',
                        },
                      ),
                      TextButton(
                        onPressed: onRegister,
                        child: Text(
                          'Register',
                          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
