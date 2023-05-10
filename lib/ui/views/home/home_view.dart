import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/main.dart';
import 'package:tools_rental_management/ui/views/settings/settings_view.dart';
import 'package:tools_rental_management/ui/views/tool_users/tool_users_view.dart';
import 'package:tools_rental_management/ui/views/tools/tools_view.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: getViewFromIndex(viewModel.currentIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
              width: MyApp.of(context).themeMode == ThemeMode.light ? 0.5 : 0.1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          unselectedIconTheme: Theme.of(context).iconTheme,
          unselectedLabelStyle: MyApp.of(context).themeMode == ThemeMode.light
              ? Theme.of(context).typography.white.bodySmall!.copyWith(fontSize: 14.0)
              : Theme.of(context).typography.black.bodySmall!.copyWith(fontSize: 14.0),
          unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedLabelStyle: MyApp.of(context).themeMode == ThemeMode.light
              ? Theme.of(context).typography.white.bodySmall!.copyWith(fontSize: 14.0)
              : Theme.of(context).typography.black.bodySmall!.copyWith(fontSize: 14.0),
          iconSize: Theme.of(context).iconTheme.size!,
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.setIndex,
          elevation: 0.0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.construction,
              ),
              label: 'Tools',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.engineering,
              ),
              label: 'Tool Users',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  Widget getViewFromIndex(int index) {
    switch (index) {
      case 0:
        return const ToolsView();
      case 1:
        return const ToolUsersView();
      case 2:
        return const SettingsView();
      default:
        return const ToolsView();
    }
  }
}
