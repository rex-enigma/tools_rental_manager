import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/main.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:tools_rental_management/ui/reusable_widgets/custom_listtile.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  // setting it to false will make sure that [ToolsViewModel] isn't disposed (ToolsViewModel.dispose function isn't called).
  @override
  bool get disposeViewModel => false;

  // setting it to true will tell the ViewModelBuilder you want only the initialization for a specialty view model to fire once
  @override
  bool get initialiseSpecialViewModelsOnce => true;

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text(
          'Settings',
          style: switch (getThemeManager(context).selectedThemeMode) {
            ThemeMode.light => Theme.of(context).typography.white.bodyLarge,
            ThemeMode.dark => Theme.of(context).typography.black.bodyLarge,
            _ => throw 'configure ThemeMode.system',
          },
        ),
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
      ),
      body: DefaultTextStyle(
        style: switch (getThemeManager(context).selectedThemeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodySmall!,
          ThemeMode.dark => Theme.of(context).typography.black.bodySmall!,
          _ => throw ' configure ThemeMode.system',
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
          child: Column(
            children: [
              Container(
                height: 170.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onPrimary,
                    width: switch (getThemeManager(context).selectedThemeMode) {
                      ThemeMode.light => 0.5,
                      ThemeMode.dark => 0.1,
                      _ => throw 'configure ThemeMode.system',
                    },
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.palette,
                                size: 30.0,
                              ),
                              Text(
                                'Theme',
                                style: switch (getThemeManager(context).selectedThemeMode) {
                                  ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
                                  ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
                                  _ => throw ' configure ThemeMode.system',
                                },
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          // CustomListTile(
                          //   leading: Icon(
                          //     Icons.light_mode,
                          //     size: 28,
                          //   ),
                          //   title: const Text('Light Mode'),
                          //   trailing: Radio<ThemeMode>(groupValue: , onChanged: (Object? value) {  }, value: ThemeMode.light,),
                          // ),
                        ],
                      ),
                    ),
                    // we have a divider at the centre
                    Column(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      locator<SettingsViewModel>();
}
