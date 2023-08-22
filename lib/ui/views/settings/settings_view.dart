import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.locator.dart';
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
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
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
                              const Icon(
                                Icons.palette,
                                size: 30.0,
                              ),
                              Text(
                                'Theme',
                                style: switch (getThemeManager(context)
                                    .selectedThemeMode) {
                                  ThemeMode.light => Theme.of(context)
                                      .typography
                                      .white
                                      .bodyMedium!,
                                  ThemeMode.dark => Theme.of(context)
                                      .typography
                                      .black
                                      .bodyMedium!,
                                  _ => throw ' configure ThemeMode.system',
                                },
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          CustomListTile(
                            leading: const Icon(
                              Icons.light_mode,
                              size: 28,
                            ),
                            title: const Text('Light Mode'),
                            trailing: Radio<ThemeMode>(
                              visualDensity: VisualDensity.compact,
                              activeColor:
                                  Theme.of(context).colorScheme.secondary,
                              fillColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.secondary),
                              value: ThemeMode.light,
                              groupValue:
                                  getThemeManager(context).selectedThemeMode,
                              // when called, will change the current selectedThemeMode in ThemeManager to ThemeMode.light
                              // which intern will cause ThemeBuilder at the top of the widget tree to invoke its builder function
                              // rebuilding the MaterialApp widget with themeMode property set to ThemeMode.light
                              onChanged: (ThemeMode? value) =>
                                  getThemeManager(context).setThemeMode(value!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // divides between the light mode top and dark mode bottom
                    Row(
                      children: [
                        //  the 48 value is a combination of the (padding of the container) + (light_mode icon) + (horizontalSpaceBtnLeadingAndTitle of the CustomListTile)
                        const SizedBox(width: 48.0),
                        Expanded(child: smallSpaceHorizontalDivider(context)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomListTile(
                        leading: const Icon(
                          Icons.dark_mode,
                          size: 28,
                        ),
                        title: const Text('Dark Mode'),
                        trailing: Radio<ThemeMode>(
                          visualDensity: VisualDensity.compact,
                          activeColor: Theme.of(context).colorScheme.secondary,
                          fillColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.secondary),
                          value: ThemeMode.dark,
                          groupValue:
                              getThemeManager(context).selectedThemeMode,
                          // when called, will change the current selectedThemeMode in ThemeManager to ThemeMode.dark
                          // which intern will cause ThemeBuilder at the top of the widget tree to invoke its builder function
                          // rebuilding the MaterialApp widget with themeMode property set to ThemeMode.dark
                          onChanged: (ThemeMode? value) =>
                              getThemeManager(context).setThemeMode(value!),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              verticalSpaceSmall,
              // this container provide a visible border for the wrapped ExpansionTile
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: switch (getThemeManager(context).selectedThemeMode) {
                      ThemeMode.light => 0.5,
                      ThemeMode.dark => 0.1,
                      _ => throw 'configure ThemeMode.system',
                    },
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Tooltip(
                            message: 'about this app',
                            child: Icon(
                              Icons.info,
                              size: 20,
                            ),
                            showDuration: Duration(seconds: 25),
                          ),
                          horizontalSpaceMedium,
                          Text(
                            'About',
                            // the text in ExpansionTile is unable to inherit our explicitly defined DefaultTextStyle, since ExpansionTile has its own DefaultTextStyle which is override ours
                            // so we set directly set the style
                            style: switch (
                                getThemeManager(context).selectedThemeMode) {
                              ThemeMode.light =>
                                Theme.of(context).typography.white.bodySmall!,
                              ThemeMode.dark =>
                                Theme.of(context).typography.black.bodySmall!,
                              _ => throw ' configure ThemeMode.system',
                            },
                          ),
                        ],
                      ),
                    ),
                    children: const [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Text(
                          'A prototype app that can assist you with managing workshop tools that you rent out.',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                    iconColor: Theme.of(context).colorScheme.onPrimary,
                    collapsedIconColor: Theme.of(context).colorScheme.onPrimary,
                    tilePadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(BuildContext context) =>
      locator<SettingsViewModel>();
}
