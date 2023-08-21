import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

class EditDialog extends StatelessWidget {
  final Widget title;

  /// a [Form] or any [FormField] that will add an edit functionality
  final Widget input;
  final VoidCallback onSaved;
  final VoidCallback onCancelled;

  const EditDialog({
    super.key,
    required this.input,
    required this.onSaved,
    required this.onCancelled,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
        alignment: Alignment.center,
        child: title,
      ),
      contentPadding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0, bottom: 20),
      actionsPadding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 20),
      contentTextStyle: switch (getThemeManager(context).selectedThemeMode) {
        ThemeMode.light => Theme.of(context).typography.white.bodySmall!,
        ThemeMode.dark => Theme.of(context).typography.black.bodySmall!,
        _ => throw ' configure ThemeMode.system',
      },
      content: input,
      actions: [
        TextButton(
          onPressed: onCancelled,
          child: Text(
            'Cancel',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        TextButton(
          onPressed: onSaved,
          child: Text(
            'Save',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        )
      ],
    );
  }
}
