import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class ConfirmDialog extends StatelessWidget {
  /// dialog message, mostly is a Text widget.
  final Widget description;

  /// this function when called will allow us to return true or false when 'confirm' or 'cancel' text button is pressed back
  /// to the function that added this Widget to the overlay stack of widget.
  ///
  final Function(DialogResponse) completer;

  const ConfirmDialog({super.key, this.description = const Text('A confirmation dialog'), required this.completer});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0, bottom: 20),
      actionsPadding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 20),
      contentTextStyle: switch (getThemeManager(context).selectedThemeMode) {
        ThemeMode.light => Theme.of(context).typography.white.bodySmall!,
        ThemeMode.dark => Theme.of(context).typography.black.bodySmall!,
        _ => throw ' configure ThemeMode.system',
      },
      content: description,
      actions: [
        TextButton(
          onPressed: () {
            // make [DialogService.showCustomDialog] return false as a response.confirm value.
            completer(DialogResponse(confirmed: false));
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        TextButton(
          onPressed: () {
            // make [DialogService.showCustomDialog] return true as a response.confirm value.
            completer(DialogResponse(confirmed: true));
          },
          child: Text(
            'confirm',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        )
      ],
    );
  }
}
// switch (getThemeManager(context).selectedThemeMode) {
//         ThemeMode.light => Theme.of(context).typography.white.bodySmall!,
//         ThemeMode.dark => Theme.of(context).typography.black.bodySmall!,
//         _ => throw ' configure ThemeMode.system',
//       },