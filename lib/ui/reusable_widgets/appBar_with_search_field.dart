import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';

class AppBarWithSearchField extends StatelessWidget {
  /// A widget to display before the toolbar's [title].
  final Widget? leading;

  /// whether to show searchBar or not
  final bool showAppBarSearchField;
  final String? searchFieldTextHint;

  /// This widget appears across the bottom of the app bar.
  final PreferredSizeWidget? bottom;

  /// the title to display when showAppBarSearchField = false
  final Widget? title;

  /// Called when the user initiates a change to the searchField's value: when they have inserted or deleted text.
  final void Function(String)? onSearchFieldValueChanged;

  /// A list of Widgets to display in a row after the [title] widget.
  final List<Widget>? actions;
  const AppBarWithSearchField({
    super.key,
    this.leading,
    this.showAppBarSearchField = false,
    this.onSearchFieldValueChanged,
    this.actions,
    this.searchFieldTextHint,
    this.bottom,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      leading: leading,
      centerTitle: true,
      title: showAppBarSearchField
          ? ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 40,
              ),
              child: TextField(
                cursorColor: Theme.of(context).colorScheme.secondary,
                cursorWidth: 1,
                style: textFormFieldInputTextStyle(context),
                decoration: InputDecoration(
                  hintText: searchFieldTextHint,
                ),
                onChanged: onSearchFieldValueChanged,
              ),
            )
          : title,
      actions: actions,
      shape: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor,
          width: switch (getThemeManager(context).selectedThemeMode) {
            ThemeMode.light => 0.5,
            ThemeMode.dark => 0.1,
            _ => throw 'configure ThemeMode.system',
          },
        ),
      ),
      bottom: bottom,
    );
  }
}
