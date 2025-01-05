import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:tools_rental_management/data/models/tool_model.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/image_type.dart';
import 'package:tools_rental_management/enums/status.dart';

class ToolViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _toolsRepoImp = locator<ToolsRepoImp>();
  final _toolUsersRepoImp = locator<ToolUsersRepoImp>();

  /// uniquely identifies a tool in the database (primary key)
  late int toolId;
  Tool? tool;
  // String? toolImagePath;
  // String? toolName;
  // Status? toolStatus;
  // int? toolRate;
  // Category? toolCategory;
  // Currency? toolCurrency;
  // String? currentToolUser;
  // // id that uniquely identifies this tool in the warehouse store.
  // int? toolUniqueId;
  // // will be extracted from the returned toolUser
  String? toolUserName;
  // DateTime? toolPurchaseDate;
  // int? purchasedPrice;
  // String? toolRentCount;

  void initState(int toolId) async {
    this.toolId = toolId;
    await fetchTool(this.toolId);
    await fetchToolUserFullName(tool?.toolUserId);
  }

  Future fetchTool(int toolId) async {
    // Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    Tool? tool = await runBusyFuture(_toolsRepoImp.getToolByIdOrNull(toolId));
    this.tool = tool;
  }

  Future fetchToolUserFullName(int? toolUserId) async {
    if (toolUserId != null) {
      String? firstName = await runBusyFuture(_toolUsersRepoImp.getToolUserFirstNameByIdOrNull(tool!.toolUserId!));
      String? lastName = await runBusyFuture(_toolUsersRepoImp.getToolUserLastNameByIdOrNull(tool!.toolUserId!));
      String fullName = '$firstName $lastName';
      toolUserName = fullName;
    }
  }

  void showStatusEditorDialog() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.toolStatusEditor,
      data: tool!.status,
    );
    // if the returned data is non-null(user hasn't canceled the dialog) and the  data is different from the one sent in, then execute
    if (response?.data != null && response?.data != tool?.status) {
      updateToolProperty(ToolProperty.toolStatus, response!.data);
    }
  }

  void showRateEditorDialog() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.toolRateEditor,
      data: tool!.rate,
    );

    // if the returned data is non-null(user hasn't canceled the dialog) and the data is different from the one sent in, then execute
    if (response!.data != null && response.data != tool!.rate) {
      print(response.data);
      updateToolProperty(ToolProperty.toolRate, response.data);
    }

    // int? editedRate = response!.data;
    // if (editedRate != null && editedRate != tool!.rate) {}
  }

  void showCategoryEditorDialog() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.toolCategoryEditor,
      data: tool!.category,
    );
    // if the returned data is non-null(user hasn't canceled the dialog) and the  data is different from the one sent in, then execute
    if (response?.data != null && response?.data != tool?.category) {
      updateToolProperty(ToolProperty.toolCategory, response!.data);
    }
  }

  void navigateToToolNamesView() async {
    var response = await _navigationService.navigateToToolNamesView();
    if (response != null) {
      updateToolProperty(ToolProperty.toolName, response);
    }
  }

  void navigateToImageView() async {
    // since the ImageView is dynamic, you need to provide it with an toolId and a ImageType as a record in order to display/fetch/update the appropriate image(in this case tool image)
    var response = await _navigationService.navigateToImageView(idImageTypeGroup: (id: toolId, imageType: ImageType.toolImage));

    // the user might update the tool image, we refetch the tool image to display the new image if it was changed
    // the [toolId] am guaranteeing its not null since this viewModel wont be disposed when we navigate to ToolImageView
    await fetchTool(toolId);
  }

  void showMoreToolInfoSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.moreToolInfo,
      // pass in the name of the tool which will be used to search for information about that tool in wikipedia(for now)
      data: tool!.name,
    );
  }

// we update a specific tool property
// the value parameter will hold the appropriate value for that specific toolProperty
  void updateToolProperty(ToolProperty toolProperty, dynamic value) async {
    switch (toolProperty) {
      case ToolProperty.toolName:
        String? updatedName = await _toolsRepoImp.updateToolName(value, toolId);
        tool = tool!.copyWith(name: updatedName);
        break;
      case ToolProperty.toolStatus:
        Status? updatedStatus = await _toolsRepoImp.updateToolStatus(value, toolId);
        tool = tool!.copyWith(status: updatedStatus);
      case ToolProperty.toolRate:
        int? updatedRate = await _toolsRepoImp.updateToolRate(value, toolId);
        tool = tool!.copyWith(rate: updatedRate);
      case ToolProperty.toolCategory:
        Category? updatedCategory = await _toolsRepoImp.updateToolCategory(value, toolId);
        tool = tool!.copyWith(category: updatedCategory);
    }

    rebuildUi();
  }

  void navigateBack() {
    _navigationService.back();
  }
}

enum ToolProperty {
  toolName,
  toolStatus,
  toolRate,
  toolCategory,
}
