import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:tools_rental_management/domain/entities/tool_entity.dart';
import 'package:tools_rental_management/domain/entities/tooluser_entity.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_user_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_category_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_name_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_rate_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_status_usecase.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/image_type.dart';
import 'package:tools_rental_management/enums/status.dart';

class ToolViewModel extends BaseViewModel {
  final DialogService _dialogService;
  final NavigationService _navigationService;
  final BottomSheetService _bottomSheetService;
  final UseCase<ToolEntity?, ToolIdParam> _getToolUseCase;
  final UseCase<ToolUserEntity?, ToolUserIdParam> _getToolUserUseCase;
  final UseCase<String?, UpdateToolNameParams> _updateToolNameUseCase;
  final UseCase<Status?, UpdateToolStatusParams> _updateToolStatusUseCase;
  final UseCase<int?, UpdateToolRateParams> _updateToolRateUseCase;
  final UseCase<Category?, UpdateToolCategoryParams> _updateToolCategoryUseCase;

  ToolViewModel({
    DialogService? dialogService,
    NavigationService? navigationService,
    BottomSheetService? bottomSheetService,
    UseCase<ToolEntity?, ToolIdParam>? getToolUseCase,
    UseCase<ToolUserEntity?, ToolUserIdParam>? getToolUserUseCase,
    UseCase<String?, UpdateToolNameParams>? updateToolNameUseCase,
    UseCase<Status?, UpdateToolStatusParams>? updateToolStatusUseCase,
    UseCase<int?, UpdateToolRateParams>? updateToolRateUseCase,
    UseCase<Category?, UpdateToolCategoryParams>? updateToolCategoryUseCase,
  })  : _dialogService = dialogService ?? locator<DialogService>(),
        _navigationService = navigationService ?? locator<NavigationService>(),
        _bottomSheetService = bottomSheetService ?? locator<BottomSheetService>(),
        _getToolUseCase = getToolUseCase ?? locator<GetToolUseCase>(),
        _getToolUserUseCase = getToolUserUseCase ?? locator<GetToolUserUseCase>(),
        _updateToolNameUseCase = updateToolNameUseCase ?? locator<UpdateToolNameUseCase>(),
        _updateToolStatusUseCase = updateToolStatusUseCase ?? locator<UpdateToolStatusUseCase>(),
        _updateToolRateUseCase = updateToolRateUseCase ?? locator<UpdateToolRateUseCase>(),
        _updateToolCategoryUseCase = updateToolCategoryUseCase ?? locator<UpdateToolCategoryUseCase>();

  /// uniquely identifies a tool in the database (primary key)
  late int toolId;
  ToolEntity? tool;
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
    ToolEntity? tool = await runBusyFuture(_getToolUseCase(ToolIdParam(toolId: toolId)));
    this.tool = tool;
  }

  Future fetchToolUserFullName(int? toolUserId) async {
    if (toolUserId != null) {
      ToolUserEntity? toolUser = await runBusyFuture(_getToolUserUseCase(ToolUserIdParam(toolUserId: toolUserId)));
      String fullName = '${toolUser?.firstName} ${toolUser?.lastName}';
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
        String? updatedName = await _updateToolNameUseCase(UpdateToolNameParams(toolName: value, toolId: toolId));
        tool = tool!.copyWith(name: updatedName);
        break;
      case ToolProperty.toolStatus:
        Status? updatedStatus = await _updateToolStatusUseCase(UpdateToolStatusParams(toolStatus: value, toolId: toolId));
        tool = tool!.copyWith(status: updatedStatus);
      case ToolProperty.toolRate:
        int? updatedRate = await _updateToolRateUseCase(UpdateToolRateParams(toolRate: value, toolId: toolId));
        tool = tool!.copyWith(rate: updatedRate);
      case ToolProperty.toolCategory:
        Category? updatedCategory = await _updateToolCategoryUseCase(UpdateToolCategoryParams(toolCategory: value, toolId: toolId));
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
