import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/assets/font_icons/font_icons.dart';
import 'package:tools_rental_management/enums/account.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';

class LoginSignUpLayout extends StatelessWidget {
  final Icon icon;
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
  final Widget? footer;

  const LoginSignUpLayout(
      {required this.icon,
      required this.title,
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
      this.footer,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 30.0,
        children: [
          Icon(
            FontIcons.gearHelmet,
            color: Theme.of(context).colorScheme.secondary,
            size: 100,
          ),
          Text(title.name.toUpperCase()),
          Padding(
            padding: const EdgeInsets.only(
              left: 36.0,
              right: 36.0,
            ),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    style: textFormFieldInputTextStyle(context),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                  FilledButton(
                    onPressed: onSubmit,
                    child: Text(
                      title == Account.login ? 'Login' : 'Sign up',
                      style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (title == Account.login)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: switch (getThemeManager(context).selectedThemeMode) {
                    ThemeMode.light => Theme.of(context).typography.white.titleMedium!,
                    ThemeMode.dark => Theme.of(context).typography.black.titleMedium!,
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
    );
  }
}
