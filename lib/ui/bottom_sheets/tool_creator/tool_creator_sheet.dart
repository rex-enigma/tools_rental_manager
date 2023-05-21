import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/assets/font_icons/font_icons.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/currency.dart';
import 'package:tools_rental_management/main.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reuable_widgets/drag_handle.dart';
import 'package:tools_rental_management/ui/views/home/home_view.dart';

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
    return Container(
      width: screenWidth(context),
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        right: 16.0,
        left: 16.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const DragHandle(),
          verticalSpaceSmall,
          Center(
            child: Text('Create a tool',
                style: switch (MyApp.of(context).themeMode) {
                  ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
                  ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
                  _ => throw ' configure ThemeMode.system',
                }),
          ),
          verticalSpaceSmall,
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  onTap: () => print('textFormField taped'),
                  readOnly: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Name of a tool',
                    labelText: 'Tool name *',
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                verticalSpaceMedium,
                TextFormField(
                  onTap: () => print('textFormField taped'),
                  readOnly: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'The date the tool was bought',
                    labelText: 'Purchased date *',
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                verticalSpaceMedium,
                DropdownButtonFormField(
                  value: Currency.kes.name,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: 'Currency *',
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
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
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: "How much the tool was purchased for",
                    labelText: 'Purchased price *',
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                verticalSpaceMedium,
                TextFormField(
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                    hintText: 'Cost of renting a tool per hour',
                    labelText: 'Rate (KES) *', // don't forget to make the KES dynamic.
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                verticalSpaceMedium,
                DropdownButtonFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                      hintText: 'Powered tool or un-powered tool',
                      labelText: 'Category *',
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category.name,
                            child: Text(category.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => {}),
                verticalSpaceMedium,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                          hintText: 'Id to be assigned to this tool',
                          labelText: 'Tool id (Unique) *',
                          floatingLabelStyle: TextStyle(color: Colors.black),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                          backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        ),
                        child: Text('Gen id'),
                        onPressed: () => {},
                      ),
                    )
                  ],
                ),
                verticalSpaceMedium,
                FormField(
                  builder: (formFieldState) => DashedCircularButtonBorderWithIcons(
                    bottomSheetType: BottomSheetType.toolCreator,
                    toolImagePath: viewModel.toolImagePath,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  @override
  ToolCreatorSheetModel viewModelBuilder(BuildContext context) => ToolCreatorSheetModel();
}

/// [DashedCircularButtonBorderWithIcons] created a circular button which has dashed border and 3
/// widget stacked on top of each other. The first widget is a greyish background, second widget is an
/// icon(either a FontIcons.circularSaw or Icons.person) and the last is an icon(Icons.photo_camera).
/// [BottomSheetType] is need so that we can be able to create a [DashedCircularButtonBorderWithIcons] with either
/// a [circularSaw] icon or a [person] icon as second widget in the stack.
/// [toolImagePath] is the path of a tool image to be displayed.
class DashedCircularButtonBorderWithIcons extends StatelessWidget {
  final BottomSheetType bottomSheetType;
  final String? toolImagePath;

  const DashedCircularButtonBorderWithIcons({
    required this.bottomSheetType,
    required this.toolImagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle button tap
        print('add a tool photo');
      },
      child: DottedBorder(
        borderType: BorderType.Circle,
        dashPattern: const [8, 8],
        strokeCap: StrokeCap.square,
        color: Theme.of(context).colorScheme.onPrimary,
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipOval(
                  child: toolImagePath == null
                      ? Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(244, 244, 244, 1),
                          ),
                        )
                      : Image.asset(
                          toolImagePath!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              if (toolImagePath == null)
                Align(
                  alignment: Alignment.center,
                  child: switch (bottomSheetType) {
                    BottomSheetType.toolCreator => const Icon(
                        FontIcons.circularSaw,
                        color: Color.fromRGBO(202, 202, 202, 1.0),
                        size: 56.0,
                      ),
                    BottomSheetType.toolUserCreator => const Icon(
                        Icons.person,
                        color: Color.fromRGBO(202, 202, 202, 1.0),
                      ),
                  },
                ),
              if (toolImagePath == null)
                const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.photo_camera,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
