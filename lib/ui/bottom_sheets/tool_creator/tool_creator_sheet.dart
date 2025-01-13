import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/currency.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/dashed_circular_border_btn_with_icons.dart';
import 'package:tools_rental_management/ui/reusable_widgets/drag_handle.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';

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
      BuildContext context, ToolCreatorSheetModel viewModel, Widget? child) {
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
                  ThemeMode.light =>
                    Theme.of(context).typography.white.bodyMedium!,
                  ThemeMode.dark =>
                    Theme.of(context).typography.black.bodyMedium!,
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
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: viewModel.toolNameTextEditingController,
                          onTap: () {
                            viewModel.navigateToToolNamesView();
                          },
                          readOnly: true,
                          style: textFormFieldInputTextStyle(context),
                          // other properties of the InputDecorator will be inherited from ThemeData.inputDecorationTheme
                          decoration: const InputDecoration(
                            hintText: 'Name of a tool',
                            labelText: 'Tool name *',
                          ),
                          validator: (value) =>
                              ToolCreatorSheetValidators.validateToolName(
                                  value),
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          controller: viewModel.purchaseDateTextEditController,
                          onTap: () {
                            // i had to pass the context because DatePickerDialog doesn't have a callback to get the date back, which if it had, i could have used it to return the date
                            // which i would wrap it in the DialogResponse and get returned by showCustomDialog
                            viewModel.showDatePickerDialog(context);
                          },
                          readOnly: true,
                          style: textFormFieldInputTextStyle(context),
                          decoration: InputDecoration(
                            hintText: 'The date the tool was bought',
                            labelText: 'Purchased date *',
                            suffixIcon: Icon(
                              Icons.calendar_today,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          validator: (value) =>
                              ToolCreatorSheetValidators.validatePurchaseDate(
                                  value),
                        ),
                        verticalSpaceMedium,
                        DropdownButtonFormField<Currency>(
                          value: null,
                          style: textFormFieldInputTextStyle(context),
                          // other properties of the InputDecorator will be inherited from ThemeData.inputDecorationTheme
                          decoration: const InputDecoration(
                            hintText: 'currency used for purchase the tool',
                            labelText: 'Currency',
                          ),
                          items: Currency.values
                              .map(
                                (currency) => DropdownMenuItem(
                                  value: currency,
                                  child: Text(currency.name.toUpperCase()),
                                ),
                              )
                              .toList(),
                          validator: (value) =>
                              ToolCreatorSheetValidators.validateCurrency(
                                  value),
                          onChanged: (value) {
                            viewModel.setCurrency(value);
                          },
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          controller:
                              viewModel.purchasedPriceTextEditingController,
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          cursorWidth: 1,
                          keyboardType: TextInputType.number,
                          style: textFormFieldInputTextStyle(context),
                          decoration: const InputDecoration(
                            hintText: "How much the tool was purchased for",
                            labelText: 'Purchased price *',
                          ),
                          validator: (value) => ToolCreatorSheetValidators
                              .validatePurchasePriceInput(value),
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          controller: viewModel.rateTextEditingController,
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          cursorWidth: 1,
                          keyboardType: TextInputType.number,
                          style: textFormFieldInputTextStyle(context),
                          decoration: const InputDecoration(
                            hintText: 'Cost of renting a tool per hour',
                            labelText: 'Rate (KES) *',
                          ),
                          validator: (value) =>
                              ToolCreatorSheetValidators.validateRate(value),
                        ),
                        verticalSpaceMedium,
                        DropdownButtonFormField<Category>(
                          value: null,
                          style: textFormFieldInputTextStyle(context),
                          decoration: const InputDecoration(
                            hintText: 'Powered tool or un-powered tool',
                            labelText: 'Category *',
                          ),
                          items: Category.values
                              .map(
                                (category) => DropdownMenuItem<Category>(
                                  value: category,
                                  child: Text(category.name),
                                ),
                              )
                              .toList(),
                          validator: (value) =>
                              ToolCreatorSheetValidators.validateCategory(
                                  value),
                          onChanged: (value) {
                            viewModel.setCategory(value);
                          },
                        ),
                        verticalSpaceMedium,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller:
                                    viewModel.toolUniqueIdTextEditingController,
                                readOnly: true,
                                style: textFormFieldInputTextStyle(context),
                                decoration: const InputDecoration(
                                  hintText:
                                      "tap 'Gen id' to generate a tool id ",
                                  labelText: 'Tool unique id  *',
                                ),
                                validator: (value) => ToolCreatorSheetValidators
                                    .validateToolUniqueId(value),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 120.0,
                              padding: const EdgeInsets.only(left: 6.0),
                              child: FilledButton(
                                style: Theme.of(context)
                                    .filledButtonTheme
                                    .style
                                    ?.copyWith(
                                      fixedSize: const WidgetStatePropertyAll(
                                        Size(120.0, 50.0),
                                      ),
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                child: const Text('Gen id'),
                                onPressed: () {
                                  viewModel.generateToolUniqueId();
                                },
                              ),
                            )
                          ],
                        ),
                        verticalSpaceMedium,
                        FormField(
                          builder: (formFieldState) {
                            return DashedCircularBorderButtonWithIcons(
                              bottomSheetType: BottomSheetType.toolCreator,
                              imagePath: viewModel.toolImagePath,
                              onPressed: () =>
                                  viewModel.showToolImageCaptureSheet(),
                              // will be true if this form has any error(when the validator returns a string value)
                              hasError: formFieldState.hasError,
                              errorMessage: formFieldState.errorText,
                            );
                          },
                          validator: (value) {
                            if (viewModel.toolImagePath == null) {
                              return 'tap to add a tool image';
                            }
                            return null;
                          },
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
                              onPressed: () {
                                // the condition will be true if all the form validators pass
                                if (viewModel.formKey.currentState!
                                    .validate()) {
                                  viewModel.submitForm();
                                }
                              },
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

  /////////// don't forget to dispose the TextEditingControllers
  @override
  void onDispose(ToolCreatorSheetModel viewModel) {
    viewModel.toolNameTextEditingController.dispose();
    viewModel.purchaseDateTextEditController.dispose();
    viewModel.purchasedPriceTextEditingController.dispose();
    viewModel.rateTextEditingController.dispose();
    viewModel.toolUniqueIdTextEditingController.dispose();
    super.onDispose(viewModel);
  }

  @override
  ToolCreatorSheetModel viewModelBuilder(BuildContext context) =>
      ToolCreatorSheetModel();
}

//  TextFormField(
//                           onTap: () => print('textFormField taped'),
//                           readOnly: true,
//                           style: textFormFieldInputTextStyle(context),
//                           decoration: const InputDecoration(
//                             hintText: 'The date the tool was bought',
//                             labelText: 'Purchased date *',
//                           ),
//                         ),

// DropdownButtonFormField(
//                           value: switch (viewModel.currentSelectedTabInToolsView) {
//                             // the value will be preset to 'poweredTool' to prevent the user from selecting any other category when in ToolsView he is currently on powered tool tabView
//                             1 => Category.poweredTool.name,
//                             // the value will be preset to 'unpoweredTool' to prevent the user from selecting any other category when in ToolsView he is currently on unpowered tool tabView
//                             2 => Category.unpoweredTool.name,
//                             _ => null,
//                           },
//                           style: textFormFieldInputTextStyle(context),
//                           decoration: InputDecoration(
//                               hintText: 'Powered tool or un-powered tool',
//                               labelText: 'Category *',
//                               labelStyle: viewModel.isCategoryDropDownEnabled ? Theme.of(context).inputDecorationTheme.labelStyle : const TextStyle(color: Colors.grey),
//                               enabledBorder: viewModel.isCategoryDropDownEnabled
//                                   ? Theme.of(context).inputDecorationTheme.enabledBorder
//                                   : Theme.of(context).inputDecorationTheme.disabledBorder),
//                           items: Category.values
//                               .map(
//                                 (category) => DropdownMenuItem<Category>(
//                                   value: category,
//                                   child: Text(category.name),
//                                 ),
//                               )
//                               .toList(),
//                           // allow the value of the DropDownFormField to be changed when viewModel.isCategoryDropDownEnabled = true, this means the user is on allTabView
//                           onChanged: viewModel.isCategoryDropDownEnabled
//                               ? (value) {
//                                   print(value);
//                                   viewModel.setToolCategory(value as Category);
//                                 }
//                               : null,
//                         ),
