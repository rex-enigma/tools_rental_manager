import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.dart';
import 'package:tools_rental_management/ui/common/app_colors.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/drag_handle.dart';

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
                  leading: Icon(Icons
                      .arrow_back_ios), // make it dynamic to indicate X for canceling the selected tool items
                  centerTitle: true,
                  title: Text(
                    'select tool(s)', // make the text dynamic to indicate when the user multiselect  tool items
                    style: switch (getThemeManager(context).selectedThemeMode) {
                      ThemeMode.light =>
                        Theme.of(context).typography.white.bodyMedium,
                      ThemeMode.dark =>
                        Theme.of(context).typography.black.bodyMedium,
                      _ => throw 'configure ThemeMode.system',
                    },
                  ),
                  actions: [
                    IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ), // make the icon dynamic to indicate 'tick' for associating the selected tool items the a tool user
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
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading:
                          Container(width: 90, height: 90, color: Colors.blue),
                      title: Text('testing'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading:
                          Container(width: 90, height: 90, color: Colors.blue),
                      title: Text('testing'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading:
                          Container(width: 90, height: 90, color: Colors.blue),
                      title: Text('testing'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading:
                          Container(width: 90, height: 90, color: Colors.blue),
                      title: Text('testing'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading:
                          Container(width: 90, height: 90, color: Colors.blue),
                      title: Text('testing'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading:
                          Container(width: 90, height: 90, color: Colors.blue),
                      title: Text('testing'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading:
                          Container(width: 90, height: 90, color: Colors.blue),
                      title: Text('testing'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading:
                          Container(width: 90, height: 90, color: Colors.blue),
                      title: Text('testing'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading:
                          Container(width: 90, height: 90, color: Colors.blue),
                      title: Text('testing'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading:
                          Container(width: 90, height: 90, color: Colors.blue),
                      title: Text('testing'),
                    ),
                  ),
                ],
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
}
