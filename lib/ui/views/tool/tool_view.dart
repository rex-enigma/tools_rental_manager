import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/enums/status.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:tools_rental_management/ui/reusable_widgets/custom_listtile.dart';

import 'tool_viewmodel.dart';

class ToolView extends StackedView<ToolViewModel> {
  final int toolId;
  const ToolView({Key? key, required this.toolId}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            viewModel.navigateBack();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        centerTitle: true,
        title: Text(
          'Tool',
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
          ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
          ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
          _ => throw ' configure ThemeMode.system',
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  height: 280.0,
                  width: 382.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                    color: const Color.fromARGB(64, 158, 158, 158),
                  ),
                  child: viewModel.tool?.toolImagePath == null
                      ? const FittedBox(
                          fit: BoxFit.contain,
                          child: Icon(
                            Icons.construction_outlined,
                            color: Colors.grey,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.file(
                            File(viewModel.tool!.toolImagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                onTap: () => viewModel.navigateToImageView(),
              ),
              verticalSpaceMedium,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomListTile(
                        horizontalSpaceBtnLeadingAndTitle: const SizedBox(),
                        title: Text(
                          'Tool name',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        subtitle: Text(
                          viewModel.tool?.name ?? 'placeHolder',
                          style: switch (getThemeManager(context).selectedThemeMode) {
                            ThemeMode.light => Theme.of(context).typography.white.bodySmall,
                            ThemeMode.dark => Theme.of(context).typography.black.bodySmall,
                            _ => throw 'configure ThemeMode.system',
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          color: Theme.of(context).colorScheme.secondary,
                          iconSize: 26.0,
                          onPressed: () => viewModel.navigateToToolNamesView(),
                        ),
                      ),
                      verticalSpaceSmall,
                      CustomListTile(
                        horizontalSpaceBtnLeadingAndTitle: const SizedBox(),
                        title: Text(
                          'Status',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            const Tooltip(
                              message:
                                  'when the tool is idle/retired/underMaintenance it can only be changed to those corresponding status value. When the tool is beingUsed its cant be changed to any status value',
                              child: Icon(
                                Icons.info,
                                size: 20,
                              ),
                              showDuration: Duration(seconds: 25),
                            ),
                            horizontalSpaceTiny,
                            Text(
                              viewModel.tool?.status.name ?? 'placeHolder',
                              style: switch (getThemeManager(context).selectedThemeMode) {
                                ThemeMode.light => Theme.of(context).typography.white.bodySmall,
                                ThemeMode.dark => Theme.of(context).typography.black.bodySmall,
                                _ => throw 'configure ThemeMode.system',
                              },
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          color: Theme.of(context).colorScheme.secondary,
                          iconSize: 26.0,
                          onPressed: switch (viewModel.tool?.status) {
                            Status.beingUsed => null, // disable the icon button preventing the user from changing status of the tool if its being used.
                            _ => () {
                                viewModel.showStatusEditorDialog();
                              } // handle when the status is idle, retired, underMaintenance or when toolStatus is null.
                          },
                        ),
                      ),
                      verticalSpaceSmall,
                      CustomListTile(
                        horizontalSpaceBtnLeadingAndTitle: const SizedBox(),
                        title: Text(
                          'Rate',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        subtitle: Text(
                          "${viewModel.tool?.currency.name ?? 'currency'} ${viewModel.tool?.rate ?? '0'}/hr",
                          style: switch (getThemeManager(context).selectedThemeMode) {
                            ThemeMode.light => Theme.of(context).typography.white.bodySmall,
                            ThemeMode.dark => Theme.of(context).typography.black.bodySmall,
                            _ => throw 'configure ThemeMode.system',
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          color: Theme.of(context).colorScheme.secondary,
                          iconSize: 26.0,
                          onPressed: () {
                            viewModel.showRateEditorDialog();
                          },
                        ),
                      ),
                      verticalSpaceSmall,
                      CustomListTile(
                        horizontalSpaceBtnLeadingAndTitle: const SizedBox(),
                        title: Text(
                          'Category',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        subtitle: Text(
                          viewModel.tool?.category.name ?? 'placeHolder',
                          style: switch (getThemeManager(context).selectedThemeMode) {
                            ThemeMode.light => Theme.of(context).typography.white.bodySmall,
                            ThemeMode.dark => Theme.of(context).typography.black.bodySmall,
                            _ => throw 'configure ThemeMode.system',
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          color: Theme.of(context).colorScheme.secondary,
                          iconSize: 26.0,
                          onPressed: () {
                            viewModel.showCategoryEditorDialog();
                          },
                        ),
                      ),
                      verticalSpaceSmall,
                      CustomListTile(
                        horizontalSpaceBtnLeadingAndTitle: const SizedBox(),
                        title: Text(
                          'Current tool user',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        subtitle: Text(
                          viewModel.toolUserName ?? 'None',
                          style: switch (getThemeManager(context).selectedThemeMode) {
                            ThemeMode.light => Theme.of(context).typography.white.bodySmall,
                            ThemeMode.dark => Theme.of(context).typography.black.bodySmall,
                            _ => throw 'configure ThemeMode.system',
                          },
                        ),
                      ),
                      verticalSpaceSmall,
                      CustomListTile(
                        horizontalSpaceBtnLeadingAndTitle: const SizedBox(),
                        title: Text(
                          'Tool unique id',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        subtitle: Text(
                          viewModel.tool?.toolUniqueId.toString() ?? 'placeHolder',
                          style: switch (getThemeManager(context).selectedThemeMode) {
                            ThemeMode.light => Theme.of(context).typography.white.bodySmall,
                            ThemeMode.dark => Theme.of(context).typography.black.bodySmall,
                            _ => throw 'configure ThemeMode.system',
                          },
                        ),
                      ),
                      verticalSpaceSmall,
                      CustomListTile(
                        horizontalSpaceBtnLeadingAndTitle: const SizedBox(),
                        title: Text(
                          'Purchased date',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        subtitle: Text(
                          viewModel.tool?.boughtAt.toIso8601String() ?? 'placeHolder',
                          style: switch (getThemeManager(context).selectedThemeMode) {
                            ThemeMode.light => Theme.of(context).typography.white.bodySmall,
                            ThemeMode.dark => Theme.of(context).typography.black.bodySmall,
                            _ => throw 'configure ThemeMode.system',
                          },
                        ),
                      ),
                      verticalSpaceSmall,
                      CustomListTile(
                        horizontalSpaceBtnLeadingAndTitle: const SizedBox(),
                        title: Text(
                          'Purchased price',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        subtitle: Text(
                          viewModel.tool?.purchasedPrice.toString() ?? '0',
                          style: switch (getThemeManager(context).selectedThemeMode) {
                            ThemeMode.light => Theme.of(context).typography.white.bodySmall,
                            ThemeMode.dark => Theme.of(context).typography.black.bodySmall,
                            _ => throw 'configure ThemeMode.system',
                          },
                        ),
                      ),
                      verticalSpaceSmall,
                      CustomListTile(
                        horizontalSpaceBtnLeadingAndTitle: const SizedBox(),
                        title: Text(
                          'Rent count',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        subtitle: Text(
                          viewModel.tool?.rentCount.toString() ?? '0',
                          style: switch (getThemeManager(context).selectedThemeMode) {
                            ThemeMode.light => Theme.of(context).typography.white.bodySmall,
                            ThemeMode.dark => Theme.of(context).typography.black.bodySmall,
                            _ => throw 'configure ThemeMode.system',
                          },
                        ),
                      ),
                      verticalSpaceSmall,
                      OutlinedButton(
                        onPressed: () => viewModel.showMoreToolInfoSheet(),
                        child: const Text('Read more'),
                      ),
                      verticalSpaceSmall,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  ToolViewModel viewModelBuilder(BuildContext context) => ToolViewModel();

  @override
  void onViewModelReady(ToolViewModel viewModel) {
    viewModel.initState(toolId);
    super.onViewModelReady(viewModel);
  }
}
