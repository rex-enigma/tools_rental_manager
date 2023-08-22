import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/custom_listtile.dart';
import 'package:tools_rental_management/ui/reusable_widgets/drag_handle.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';
import 'package:tools_rental_management/ui/views/tool_user/tool_user_view.dart';

import 'select_tool_sheet_model.dart';

class SelectToolSheet extends StackedView<SelectToolSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const SelectToolSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SelectToolSheetModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Container(
        height: halfScreenHeight(context) + 100.0,
        width: screenWidth(context),
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            const DragHandle(),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 60.0,
                maxWidth: screenHeight(context),
              ),
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  leading: viewModel.selectedIdleTools
                          .isNotEmpty // remove the X close button if viewMode.selectedTools is empty
                      ? IconButton(
                          onPressed: () {
                            viewModel.deselectAllIdleTools();
                          },
                          icon: const Icon(Icons.close),
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      : const SizedBox(),
                  centerTitle: true,
                  title: viewModel.isAnyToolSelected
                      ? Text(
                          "${viewModel.selectedIdleTools.length} tool${viewModel.selectedIdleTools.length > 1 ? 's' : ''} selected",
                          style: appBarTitleTextStyle(context,
                              displayFontSizeMedium: true),
                        )
                      : Text(
                          'select tool(s)',
                          style: appBarTitleTextStyle(context,
                              displayFontSizeMedium: true),
                        ),
                  actions: viewModel.selectedIdleTools.isEmpty
                      ? null
                      : [
                          IconButton(
                            onPressed: () {
                              // return the selected idle tools back to ToolUserView for them to be associated with the current displayed tool user.
                              // SheetResponse will wrap one or more idle tools and the idle(s) are guaranteed to be returned since if their isn't any idle tool that is selected, the check button wont be visible in the UI
                              completer!(SheetResponse(
                                  data: viewModel.selectedIdleTools));
                            },
                            icon: Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                  shape: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: switch (
                          getThemeManager(context).selectedThemeMode) {
                        ThemeMode.light => 0.5,
                        ThemeMode.dark => 0.1,
                        _ => throw 'configure ThemeMode.system',
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: viewModel.idleTools.isEmpty
                  ? Center(
                      child: Text(
                        'No idle tool(s) to rent out',
                        style: switch (
                            getThemeManager(context).selectedThemeMode) {
                          ThemeMode.light =>
                            Theme.of(context).typography.white.bodyMedium,
                          ThemeMode.dark =>
                            Theme.of(context).typography.black.bodyMedium,
                          _ => throw 'configure ThemeMode.system',
                        },
                      ),
                    )
                  : ListView(
                      children: viewModel.idleTools.map((idleTool) {
                        return InkWell(
                          onTap: () {
                            // if a tool is already selected, then it will be found in viewModel.selectedTools, so we have to remove it first
                            if (viewModel.selectedIdleTools
                                .contains(idleTool)) {
                              viewModel.deselectIdleTool(idleTool);
                              return;
                            }
                            // add the idleTool to the viewModel.selectedTools
                            viewModel.selectTool(idleTool);
                          },
                          child: Container(
                            color: viewModel.selectedIdleTools
                                    .contains(idleTool)
                                ? selectedToolBackGroundColor(context)
                                : null, // we are checking if our selectedTools list contains a toolTile that was long pressed or pressed(when isAnyToolSelected is true)
                            padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 5.0,
                                top: 10.0,
                                bottom: 10.0),
                            child: CustomListTile(
                              contentVerticalAlignment:
                                  CrossAxisAlignment.start,
                              leading: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  borderRadius: BorderRadius.circular(6.0),
                                  //color: const Color.fromARGB(64, 158, 158, 158),
                                ),
                                child: idleTool.toolImagePath.isEmpty
                                    ? const FittedBox(
                                        child: Icon(
                                          Icons.construction,
                                          color: Colors.grey,
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.file(
                                          File(idleTool.toolImagePath),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                              title: Text(
                                idleTool.name,
                                style: switch (getThemeManager(context)
                                    .selectedThemeMode) {
                                  ThemeMode.light => Theme.of(context)
                                      .typography
                                      .white
                                      .titleMedium!,
                                  ThemeMode.dark => Theme.of(context)
                                      .typography
                                      .black
                                      .titleMedium!,
                                  _ => throw ' configure ThemeMode.system',
                                },
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Status : ',
                                          style:
                                              subtitleFirstSubStringTextStyle(
                                                  context),
                                        ),
                                        TextSpan(
                                          text: idleTool.status.name,
                                          style: subtitleLastSubStringTextStyle(
                                              context,
                                              status: idleTool.status),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Category : ',
                                          style:
                                              subtitleFirstSubStringTextStyle(
                                                  context),
                                        ),
                                        TextSpan(
                                          text: idleTool.category.name,
                                          style: subtitleLastSubStringTextStyle(
                                              context),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Tool unique id : ',
                                          style:
                                              subtitleFirstSubStringTextStyle(
                                                  context),
                                        ),
                                        TextSpan(
                                          text:
                                              idleTool.toolUniqueId.toString(),
                                          style: subtitleLastSubStringTextStyle(
                                              context),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
            ),

            // just testing, should be replaced with the ListView.builder()
          ],
        ),
      ),
    );
  }

  @override
  SelectToolSheetModel viewModelBuilder(BuildContext context) =>
      SelectToolSheetModel();

  @override
  void onViewModelReady(SelectToolSheetModel viewModel) {
    viewModel.initState();
    super.onViewModelReady(viewModel);
  }
}
