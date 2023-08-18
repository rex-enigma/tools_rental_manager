import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/enums/national_id_side.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/dashed_circular_border_btn_with_icons.dart';
import 'package:tools_rental_management/ui/reusable_widgets/drag_handle.dart';
import 'package:tools_rental_management/ui/reusable_widgets/national_id_button.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';

import 'tool_user_creator_sheet_model.dart';

class ToolUserCreatorSheet extends StackedView<ToolUserCreatorSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ToolUserCreatorSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolUserCreatorSheetModel viewModel,
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
          children: [
            const DragHandle(),
            verticalSpaceSmall,
            Center(
              child: Text(
                'Create a tool user',
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
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: viewModel.firstNameTextEditingController,
                          cursorColor: Theme.of(context).colorScheme.onPrimary,
                          cursorWidth: 1,
                          style: textFormFieldInputTextStyle(context),
                          // other properties of the InputDecorator will be inherited from ThemeData.inputDecorationTheme
                          decoration: const InputDecoration(
                            hintText: 'Your first name',
                            labelText: 'First Name *',
                          ),
                          validator: (value) => ToolUserCreatorSheetValidators
                              .validateToolUserFirstName(value),
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          controller: viewModel.lastNameTextEditingController,
                          cursorColor: Theme.of(context).colorScheme.onPrimary,
                          cursorWidth: 1,
                          style: textFormFieldInputTextStyle(context),
                          decoration: const InputDecoration(
                            hintText: 'Your last name',
                            labelText: 'Last Name *',
                          ),
                          validator: (value) => ToolUserCreatorSheetValidators
                              .validateToolUserLastName(value),
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          controller:
                              viewModel.phoneNumberTextEditingController,
                          cursorColor: Theme.of(context).colorScheme.onPrimary,
                          cursorWidth: 1,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(12),
                          ],
                          style: textFormFieldInputTextStyle(context),
                          decoration: const InputDecoration(
                            hintText: 'Your phone number',
                            labelText: 'Phone number *',
                          ),
                          validator: (value) => ToolUserCreatorSheetValidators
                              .validateToolUserPhoneNumber(value),
                        ),
                        verticalSpaceMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormField(
                              builder: (formFieldState) {
                                return NationalIdButton(
                                  onPressed: () {
                                    viewModel.showNationalIdImageCaptureSheet(
                                        NationalIdSide.front);
                                  },
                                  nationalIdImage:
                                      viewModel.frontNationalIdImagePath,
                                  nationalIdSide: NationalIdSide.front,
                                  hasError: formFieldState.hasError,
                                  errorMessage: formFieldState.errorText,
                                );
                              },
                              validator: (value) {
                                if (viewModel.frontNationalIdImagePath ==
                                    null) {
                                  return "add front national id";
                                }
                                return null;
                              },
                            ),
                            FormField(
                              builder: (formFieldState) {
                                return NationalIdButton(
                                  onPressed: () {
                                    viewModel.showNationalIdImageCaptureSheet(
                                        NationalIdSide.back);
                                  },
                                  nationalIdImage:
                                      viewModel.backNationalIdImagePath,
                                  nationalIdSide: NationalIdSide.back,
                                  hasError: formFieldState.hasError,
                                  errorMessage: formFieldState.errorText,
                                );
                              },
                              validator: (value) {
                                if (viewModel.backNationalIdImagePath == null) {
                                  return "add back national id";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        verticalSpaceMedium,
                        FormField(
                          builder: (formFieldState) {
                            return DashedCircularBorderButtonWithIcons(
                              bottomSheetType: BottomSheetType.toolUserCreator,
                              imagePath: viewModel.userImagePath,
                              onPressed: () =>
                                  viewModel.showToolUserImageCaptureSheet(),
                              hasError: formFieldState.hasError,
                              errorMessage: formFieldState.errorText,
                            );
                          },
                          validator: (value) {
                            if (viewModel.userImagePath == null) {
                              return 'tap to add a tool user image';
                            }
                            return null;
                          },
                        ),
                        verticalSpaceMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              // style inherited from ThemeData.outlineButtonTheme.style
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
                                  // submit form if all the forms are valid
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
            )
          ],
        ),
      ),
    );
  }

  @override
  ToolUserCreatorSheetModel viewModelBuilder(BuildContext context) =>
      ToolUserCreatorSheetModel();

  @override
  void onDispose(ToolUserCreatorSheetModel viewModel) {
    viewModel.firstNameTextEditingController.dispose();
    viewModel.lastNameTextEditingController.dispose();
    viewModel.phoneNumberTextEditingController.dispose();
    super.onDispose(viewModel);
  }
}
