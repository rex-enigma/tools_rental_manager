import 'package:flutter/material.dart';
import 'package:tools_rental_management/ui/common/app_colors.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reuable_widgets/drag_handle.dart';

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
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const DragHandle(),
          horizontalSpaceTiny,
          Container(
            height: 800,
            width: 100,
            color: Colors.green,
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
