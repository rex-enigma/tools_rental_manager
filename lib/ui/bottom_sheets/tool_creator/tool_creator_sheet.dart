import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/currency.dart';
import 'package:tools_rental_management/main.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/dashed_circular_border_btn_with_icons.dart';
import 'package:tools_rental_management/ui/reusable_widgets/drag_handle.dart';
import 'package:tools_rental_management/ui/reusable_widgets/input_text_style.dart';

import 'tool_creator_sheet_model.dart';

class ToolCreatorSheet extends StackedView<ToolCreatorSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ToolCreatorSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolCreatorSheetModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Container(
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
          // this one sets the height of the column to be its children's height.
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const DragHandle(),
            verticalSpaceSmall,
            Center(
              child: Text(
                'Create a tool',
                style: switch (getThemeManager(context).selectedThemeMode) {
                  ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
                  ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
                  _ => throw ' configure ThemeMode.system',
                },
              ),
            ),
            verticalSpaceSmall,
            smallSpaceHorizontalDivider(context),
            verticalSpaceSmall,
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    right: 16.0,
                    left: 16.0,
                  ),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          onTap: () => print('textFormField taped'),
                          readOnly: true,
                          style: textFormFieldInputTextStyle(context),
                          // other properties of the InputDecorator will be inherited from ThemeData.inputDecorationTheme
                          decoration: const InputDecoration(
                            hintText: 'Name of a tool',
                            labelText: 'Tool name *',
                          ),
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          onTap: () => print('textFormField taped'),
                          readOnly: true,
                          style: textFormFieldInputTextStyle(context),
                          decoration: const InputDecoration(
                            hintText: 'The date the tool was bought',
                            labelText: 'Purchased date *',
                          ),
                        ),
                        verticalSpaceMedium,
                        DropdownButtonFormField(
                          value: Currency.kes.name,
                          style: textFormFieldInputTextStyle(context),
                          // other properties of the InputDecorator will be inherited from ThemeData.inputDecorationTheme
                          decoration: const InputDecoration(
                            labelText: 'Currency',
                          ),
                          items: Currency.values
                              .map(
                                (currency) => DropdownMenuItem(
                                  value: currency.name,
                                  child: Text(currency.name.toUpperCase()),
                                ),
                              )
                              .toList(),
                          onChanged: (value) => {},
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          cursorColor: Theme.of(context).colorScheme.onPrimary,
                          cursorWidth: 1,
                          style: textFormFieldInputTextStyle(context),
                          decoration: const InputDecoration(
                            hintText: "How much the tool was purchased for",
                            labelText: 'Purchased price *',
                          ),
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          cursorColor: Theme.of(context).colorScheme.onPrimary,
                          cursorWidth: 1,
                          style: textFormFieldInputTextStyle(context),
                          decoration: const InputDecoration(
                            hintText: 'Cost of renting a tool per hour',
                            labelText: 'Rate (KES) *', // don't forget to make the KES dynamic.
                          ),
                        ),
                        verticalSpaceMedium,
                        DropdownButtonFormField(
                          style: textFormFieldInputTextStyle(context),
                          decoration: const InputDecoration(
                            hintText: 'Powered tool or un-powered tool',
                            labelText: 'Category *',
                          ),
                          items: Category.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category.name,
                                  child: Text(category.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) => {},
                        ),
                        verticalSpaceMedium,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: TextFormField(
                                readOnly: true,
                                style: textFormFieldInputTextStyle(context),
                                decoration: const InputDecoration(
                                  hintText: 'Id to be assigned to this tool',
                                  labelText: 'Tool id (Unique) *',
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 120.0,
                              padding: const EdgeInsets.only(left: 6.0),
                              child: FilledButton(
                                style: Theme.of(context).filledButtonTheme.style?.copyWith(
                                      fixedSize: const MaterialStatePropertyAll(
                                        Size(120.0, 50.0),
                                      ),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                child: const Text('Gen id'),
                                onPressed: () => {},
                              ),
                            )
                          ],
                        ),
                        verticalSpaceMedium,
                        FormField(
                          builder: (formFieldState) => DashedCircularBorderButtonWithIcons(
                            bottomSheetType: BottomSheetType.toolCreator,
                            imagePath: viewModel.toolImagePath,
                            onPressed: () {
                              // Handle button tap
                              print('add a tool photo');
                            },
                          ),
                        ),
                        verticalSpaceMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            FilledButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () => {},
                              child: const Text('Add'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ToolCreatorSheetModel viewModelBuilder(BuildContext context) => ToolCreatorSheetModel();
}
