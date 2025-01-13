import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/reusable_widgets/drag_handle.dart';

import 'more_tool_info_sheet_model.dart';

class MoreToolInfoSheet extends StackedView<MoreToolInfoSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const MoreToolInfoSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MoreToolInfoSheetModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: DefaultTextStyle(
        style: switch (getThemeManager(context).selectedThemeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodySmall!,
          ThemeMode.dark => Theme.of(context).typography.black.bodySmall!,
          _ => throw ' configure ThemeMode.system',
        },
        child: Container(
          height: halfScreenHeight(context) + 200.0,
          width: screenWidth(context),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.center,
                child: DragHandle(),
              ),
              verticalSpaceSmall,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpaceSmall,
                      Container(
                        height: 280.0,
                        width: 382.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                          color: const Color.fromARGB(64, 158, 158, 158),
                        ),
                        child: viewModel.isBusy || viewModel.toolArticle == null
                            ? const FittedBox(
                                fit: BoxFit.contain,
                                child: Icon(
                                  Icons.construction_outlined,
                                  color: Colors.grey,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  viewModel.navigateToRemoteImageView(context);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    viewModel.toolArticle!.urlImagePath!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                      verticalSpaceMedium,
                      const Align(
                        alignment: Alignment.center,
                        child: Text('source: wikipedia'),
                      ),
                      verticalSpaceSmall,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          viewModel.isBusy || viewModel.toolArticle == null
                              ? 'Tool Name'
                              : viewModel.toolArticle!.title,
                          style: TextStyle(
                              fontSize: 25,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(viewModel.toolArticle?.description ??
                            'description'),
                      ),
                      verticalSpaceSmall,
                      viewModel.isBusy || viewModel.toolArticle == null
                          ? SkeletonLoader(
                              loading: true,
                              child: SizedBox(
                                width: screenWidth(context),
                                height: 200,
                              ),
                            )
                          : Text(
                              viewModel.toolArticle!.excerpt,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  MoreToolInfoSheetModel viewModelBuilder(BuildContext context) =>
      MoreToolInfoSheetModel();

  @override
  void onViewModelReady(MoreToolInfoSheetModel viewModel) {
    viewModel.initState(request.data);
    super.onViewModelReady(viewModel);
  }
}
