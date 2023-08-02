import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/assets/font_icons/font_icons.dart';
import 'package:tools_rental_management/main.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontIcons.gearHelmet,
              color: Theme.of(context).colorScheme.secondary,
              size: 100,
            ),
            verticalSpaceTiny,
            Text(
              'TORENMAN',
              style: switch (MyApp.of(context).themeMode) {
                ThemeMode.light => Theme.of(context).typography.white.bodyLarge,
                ThemeMode.dark => Theme.of(context).typography.black.bodyLarge,
                _ => throw 'configure ThemeMode.system',
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'initializing...',
                  style: switch (MyApp.of(context).themeMode) {
                    ThemeMode.light =>
                      Theme.of(context).typography.white.bodySmall,
                    ThemeMode.dark =>
                      Theme.of(context).typography.black.bodySmall,
                    _ => throw 'configure ThemeMode.system',
                  },
                ),
                horizontalSpaceSmall,
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                    strokeWidth: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
