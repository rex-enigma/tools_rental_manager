import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/enums/national_id_side.dart';
import 'package:tools_rental_management/main.dart';
import 'package:tools_rental_management/ui/common/app_colors.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/dashed_circular_border_btn_with_icons.dart';
import 'package:tools_rental_management/ui/reusable_widgets/drag_handle.dart';
import 'package:tools_rental_management/ui/reusable_widgets/national_id_button.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const DragHandle(),
            verticalSpaceSmall,
            Center(
              child: Text(
                'Create a tool user',
                style: switch (MyApp.of(context).themeMode) {
                  ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
                  ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
                  _ => throw ' configure ThemeMode.system',
                },
              ),
            ),
            Divider(
              color: Theme.of(context).dividerColor,
              height: 10.0,
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          cursorColor: Theme.of(context).colorScheme.onPrimary,
                          cursorWidth: 1,
                          decoration: const InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                            hintText: 'Your first name',
                            labelText: 'First Name *',
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          cursorColor: Theme.of(context).colorScheme.onPrimary,
                          cursorWidth: 1,
                          decoration: const InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                            hintText: 'Your last name',
                            labelText: 'Last Name *',
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                        verticalSpaceMedium,
                        // PhoneFormField is a third-party package
                        PhoneFormField(
                          cursorColor: Theme.of(context).colorScheme.onPrimary,
                          cursorWidth: 1,
                          defaultCountry: IsoCode.KE,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(borderSide: BorderSide()),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                            labelText: 'phone number *',
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                        verticalSpaceMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NationalIdButton(
                              onPressed: () => {},
                              nationalIdImage: viewModel.frontNationalIdImagePath,
                              nationalIdSide: NationalIdSide.front,
                            ),
                            NationalIdButton(
                              onPressed: () => {},
                              nationalIdImage: viewModel.backNationalIdImagePath,
                              nationalIdSide: NationalIdSide.back,
                            ),
                          ],
                        ),
                        verticalSpaceMedium,
                        DashedCircularBorderButtonWithIcons(
                          bottomSheetType: BottomSheetType.toolUserCreator,
                          imagePath: viewModel.userImagePath,
                          onPressed: () => {},
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
                              onPressed: () => {},
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
            )
          ],
        ),
      ),
    );
  }

  @override
  ToolUserCreatorSheetModel viewModelBuilder(BuildContext context) => ToolUserCreatorSheetModel();
}
