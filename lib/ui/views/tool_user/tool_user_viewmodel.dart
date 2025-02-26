import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:tools_rental_management/app/app.snackbars.dart';
import 'package:tools_rental_management/domain/entities/tool_entity.dart';
import 'package:tools_rental_management/domain/entities/tooluser_entity.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_user_usecase.dart';
import 'package:tools_rental_management/domain/usecases/rent_out_tool_usecase.dart';
import 'package:tools_rental_management/domain/usecases/repossess_tool_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_user_avatar_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_user_first_name_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_user_last_name_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_user_phone_number_usecase.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/enums/image_type.dart';

class ToolUserViewModel extends BaseViewModel {
  final BottomSheetService _bottomSheetService;
  final DialogService _dialogService;
  final NavigationService _navigationService;
  final SnackbarService _snackbarService;
  final UseCase<ToolUserEntity?, ToolUserIdParam> _getToolUserUseCase;
  final UseCase<String?, UpdateToolUserFirstNameParams>
      _updateToolUserFirstNameUseCase;
  final UseCase<String?, UpdateToolUserLastNameParams>
      _updateToolUserLastNameUseCase;
  final UseCase<int?, UpdateToolUserPhoneNumberParams>
      _updateToolUserPhoneNumberUseCase;
  final UseCase<String?, UpdateToolUserAvatarImageParams>
      _updateToolUserAvatarImageUseCase;
  final UseCase<List<ToolEntity>, RentOutToolParams> _rentOutToolUseCase;
  final UseCase<int, RepossessToolParam> _repossessToolUseCase;

  ToolUserViewModel(
      {BottomSheetService? bottomSheetService,
      DialogService? dialogService,
      NavigationService? navigationService,
      UseCase<ToolUserEntity?, ToolUserIdParam>? getToolUserUseCase,
      SnackbarService? snackbarService,
      UseCase<String?, UpdateToolUserFirstNameParams>?
          updateToolUserFirstNameUseCase,
      UseCase<String?, UpdateToolUserLastNameParams>?
          updateToolUserLastNameUseCase,
      UseCase<int?, UpdateToolUserPhoneNumberParams>?
          updateToolUserPhoneNumberUseCase,
      UseCase<String?, UpdateToolUserAvatarImageParams>?
          updateToolUserAvatarImageUseCase,
      UseCase<List<ToolEntity>, RentOutToolParams>? rentOutToolUseCase,
      UseCase<int, RepossessToolParam>? repossessToolUseCase})
      : _bottomSheetService =
            bottomSheetService ?? locator<BottomSheetService>(),
        _dialogService = dialogService ?? locator<DialogService>(),
        _navigationService = navigationService ?? locator<NavigationService>(),
        _snackbarService = snackbarService ?? locator<SnackbarService>(),
        _getToolUserUseCase =
            getToolUserUseCase ?? locator<GetToolUserUseCase>(),
        _updateToolUserFirstNameUseCase = updateToolUserFirstNameUseCase ??
            locator<UpdateToolUserFirstNameUseCase>(),
        _updateToolUserLastNameUseCase = updateToolUserLastNameUseCase ??
            locator<UpdateToolUserLastNameUseCase>(),
        _updateToolUserPhoneNumberUseCase = updateToolUserPhoneNumberUseCase ??
            locator<UpdateToolUserPhoneNumberUseCase>(),
        _updateToolUserAvatarImageUseCase = updateToolUserAvatarImageUseCase ??
            locator<UpdateToolUserAvatarImageUseCase>(),
        _rentOutToolUseCase =
            rentOutToolUseCase ?? locator<RentOutToolUseCase>(),
        _repossessToolUseCase =
            repossessToolUseCase ?? locator<RepossessToolUseCase>();

  late int toolUserId;
  ToolUserEntity? toolUser;
  // String? firstName;
  // String? lastName;
  // String? avatarImagePath;
  // int? phoneNumber;
  // String? frontNationalIdImagePath;
  // String? backNationalIdImagePath;

  // List<Tool> tools = [];
  // selected tools to be repossessed back
  List<ToolEntity> selectedTools = [];
  bool isAnyToolSelected = false;

  void initState(int toolUserId) async {
    this.toolUserId = toolUserId;
    await fetchToolUser(this.toolUserId);
  }

  void selectTool(ToolEntity tool) {
    isAnyToolSelected = true;
    selectedTools.add(tool);
    rebuildUi();
  }

  void deselectTool(ToolEntity tool) {
    selectedTools.remove(tool);
    if (selectedTools.isEmpty) isAnyToolSelected = false;
    rebuildUi();
  }

  void clearSelectedTools() {
    selectedTools.clear();
    isAnyToolSelected = false;
    rebuildUi();
  }

  Future fetchToolUser(int toolUserId) async {
    // Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    ToolUserEntity? toolUser = await runBusyFuture(
        _getToolUserUseCase(ToolUserIdParam(toolUserId: toolUserId)));
    // only order toolUser.tools if the toolUser.tools is not null
    if (toolUser?.toolEntities != null) {
      //
      toolUser!.toolEntities!
          .sort((toolA, toolB) => toolB.toolId!.compareTo(toolA.toolId!));
      this.toolUser = toolUser;
    } else {
      this.toolUser = toolUser;
    }
  }

  void showFirstNameEditorDialog() async {
    var response = await _dialogService.showCustomDialog(
      title: 'Edit tool user first name',
      // will be used as labelText for the TextFormField in the Dialog
      description: 'First name *',
      variant: DialogType.toolUserNameEditor,
      // send the current toolUser.firstName so that the TextFormField controller get initialized with it
      data: toolUser!.firstName,
    );

    String? firstName = response?.data;
    // make sure the first name is updated only when the text returned isn't similar will toolUser.firstName and isn't null
    if (firstName != null && firstName != toolUser!.firstName) {
      await _updateToolUserFirstNameUseCase(UpdateToolUserFirstNameParams(
          toolUserFirstName: firstName, toolUserId: toolUserId));
      await fetchToolUser(toolUserId);
    }
  }

  void showLastNameEditorDialog() async {
    var response = await _dialogService.showCustomDialog(
      title: 'Edit tool user last name',
      // will be used as labelText for the TextFormField in the Dialog
      description: 'Last name *',
      variant: DialogType.toolUserNameEditor,
      // send the current toolUser.lastName so the that the TextFormField controller get initialized with it
      data: toolUser!.lastName,
    );
    String? lastName = response?.data;
    // make sure the last name is updated only when the text returned isn't similar will toolUser.LastName and null
    if (lastName != null && lastName != toolUser!.lastName) {
      await _updateToolUserLastNameUseCase(UpdateToolUserLastNameParams(
          toolUserLastName: lastName, toolUserId: toolUserId));
      await fetchToolUser(toolUserId);
    }
  }

  void showPhoneNumberEditorDialog() async {
    var response = await _dialogService.showCustomDialog(
      title: 'Edit tool user phone number',
      // will be used as labelText for the TextFormField in the Dialog
      description: 'Phone number *',
      variant: DialogType.toolUserPhonenumberEditor,
      // send the current toolUser.phoneNumber so the that the TextFormField controller get initialized with it
      data: toolUser!.phoneNumber.toString(),
    );
    int? phoneNumber = response?.data;
    // make sure the phone number is updated only when the integer returned isn't similar will toolUser.phoneNumber and null
    if (phoneNumber != null && phoneNumber != toolUser!.phoneNumber) {
      await _updateToolUserPhoneNumberUseCase(UpdateToolUserPhoneNumberParams(
          toolUserPhoneNumber: phoneNumber, toolUserId: toolUserId));
      await fetchToolUser(toolUserId);
    }
  }

  void showToolUserImageCaptureSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      // title to be used for the ImageCaptureSheet
      title: 'Tool user image',
      variant: BottomSheetType.imageCapture,
      // send the avatarImagePath to the ImageCaptureSheet for it to be removed if the user has selected one and what to update with a new one
      data: toolUser?.avatarImagePath,
    );
    print(response?.data);

    if (response?.data != null) {
      await _updateToolUserAvatarImageUseCase(UpdateToolUserAvatarImageParams(
          toolUserAvatarImagePath: response!.data, toolUserId: toolUserId));
      await fetchToolUser(toolUserId);
    }
  }

  void showSelectedToolSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.selectTool,
    );
    List<ToolEntity>? idleTools = response?.data;
    // only start the process of associating the returned idle tools if response isn't null (the user haven't dragged down the selectToolSheet or taped the tapped the background scrim of that selectToolSheet)
    if (idleTools != null) {
      rentTools(idleTools);
    }
  }

  /// the ImageType parameter determines what image will be fetched/displayed/updated in the ImageView
  void navigateToImageView({required ImageType imageType}) async {
    switch (imageType) {
      case ImageType.toolUserImage:
        // since the ImageView is dynamic, you need to provide it with an toolId and a ImageType as a record in order to display/fetch/update the appropriate image(in this case tool image)
        await _navigationService.navigateToImageView(idImageTypeGroup: (
          id: toolUserId,
          imageType: ImageType.toolUserImage
        ));
        break;
      case ImageType.frontNationalIdImage:
        // since the ImageView is dynamic, you need to provide it with an toolId and a ImageType as a record in order to display/fetch/update the appropriate image(in this case tool image)
        await _navigationService.navigateToImageView(idImageTypeGroup: (
          id: toolUserId,
          imageType: ImageType.frontNationalIdImage
        ));
        break;
      case ImageType.backNationalIdImage:
        // since the ImageView is dynamic, you need to provide it with an toolId and a ImageType as a record in order to display/fetch/update the appropriate image(in this case tool image)
        await _navigationService.navigateToImageView(idImageTypeGroup: (
          id: toolUserId,
          imageType: ImageType.backNationalIdImage
        ));
        break;
      default:
        throw 'The imageType should be either: ImageType.toolUserImage or  ImageType.frontNationalIdImage or  ImageType.frontNationalIdImage but $imageType was received';
    }
    // the user might update one of toolUserImage or frontNationalIdImage or backNationalIdImage, we refetch the tool user data to display the new image if it was changed
    await fetchToolUser(toolUserId);
  }

  // rent out tool(s) selected from the selectToolSheet bottom sheet to this toolUser
  void rentTools(List<ToolEntity> idleTools) async {
    await runBusyFuture(_rentOutToolUseCase(
        RentOutToolParams(idleTools: idleTools, toolUserId: toolUserId)));
    await fetchToolUser(toolUserId);
    if (idleTools.length == 1) {
      _snackbarService.showCustomSnackBar(
          message:
              '${idleTools[0].name} tool has been rented out to ${toolUser!.firstName} successfully',
          variant: SnackbarType.success);
    } else if (idleTools.length == 2) {
      _snackbarService.showCustomSnackBar(
          message:
              '${idleTools[0].name} and ${idleTools[1].name} have been rented out to ${toolUser!.firstName} successfully',
          variant: SnackbarType.success);
    } else if (idleTools.length >= 3) {
      _snackbarService.showCustomSnackBar(
          message:
              '${idleTools.length} tools have been rented out to ${toolUser!.firstName} successfully',
          variant: SnackbarType.success);
    }
  }

  // repossess back the tools this toolUser was using
  // this function works with the selectedTools list
  void repossessToolsFromToolUser() async {
    await runBusyFuture(
        _repossessToolUseCase(RepossessToolParam(tools: selectedTools)));
    await fetchToolUser(toolUserId);
    // show the names of the tools in a snackbar if the rented out tool is exactly one
    if (selectedTools.length == 1) {
      _snackbarService.showCustomSnackBar(
          message:
              '${selectedTools[0].name} has been repossessed back from ${toolUser!.firstName} successfully',
          variant: SnackbarType.success);
    } else {
      _snackbarService.showCustomSnackBar(
          message:
              '${selectedTools.length} tools have been repossessed back from ${toolUser!.firstName}  successfully',
          variant: SnackbarType.success);
    }
    // clear the selectedTools after repossession completes
    clearSelectedTools();
  }

  void showToolRepossessionConfirmDialog(ToolEntity tool) async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.toolRepossessionConfirm,
      // this should be the name of the tool that is about to be repossessed back to the the owner
      title: tool.name,
      // this should be the name of the the tool user who is using this corresponding tool
      data: toolUser!.firstName,
    );

    if (response?.confirmed == true) {
      repossessAToolFromToolUser(tool);
    }
  }

  // repossess back a tool this toolUser was using
  void repossessAToolFromToolUser(ToolEntity tool) async {
    // you need to supply a list of tools to _toolsRepoImp.repossessToolsFromToolUser,
    // since we have only one tool to get repossessed, we create a list with only that one tool
    await runBusyFuture(
        _repossessToolUseCase(RepossessToolParam(tools: [tool])));
    await fetchToolUser(toolUserId);
    _snackbarService.showCustomSnackBar(
        message:
            '${tool.name} has been repossessed back from ${toolUser!.firstName} successfully',
        variant: SnackbarType.success);
  }

  void navigateToToolView(int toolId) async {
    var response = await _navigationService.navigateToToolView(toolId: toolId);
    // update this tool user, maybe in ToolView the corresponding tool of the given toolId was updated.
    await fetchToolUser(toolUserId);
  }

  void navigateBackToToolUsers() async {
    _navigationService.back();
  }
}
