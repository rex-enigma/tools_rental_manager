import 'package:flutter/material.dart';
import 'package:tools_rental_management/ui/common/app_colors.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'tool_rate_editor_dialog_model.dart';

const double _graphicSize = 60;

class ToolRateEditorDialog extends StackedView<ToolRateEditorDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ToolRateEditorDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolRateEditorDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.title ?? 'Hello Stacked Dialog!!',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      if (request.description != null) ...[
                        verticalSpaceTiny,
                        Text(
                          request.description!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: kcMediumGrey,
                          ),
                          maxLines: 3,
                          softWrap: true,
                        ),
                      ],
                    ],
                  ),
                ),
                Container(
                  width: _graphicSize,
                  height: _graphicSize,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF6E7B0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(_graphicSize / 2),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text('⭐️', style: TextStyle(fontSize: 30)),
                )
              ],
            ),
            verticalSpaceMedium,
            GestureDetector(
              onTap: () => completer(DialogResponse(confirmed: true)),
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Got it',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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
  ToolRateEditorDialogModel viewModelBuilder(BuildContext context) =>
      ToolRateEditorDialogModel();
}
