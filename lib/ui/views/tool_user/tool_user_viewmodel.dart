import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:tools_rental_management/data/data_models/tool.dart';
import 'package:tools_rental_management/data/data_models/tooluser.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/enums/image_type.dart';

class ToolUserViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _toolUsersRepoImp = locator<ToolUsersRepoImp>();
  final _navigationService = locator<NavigationService>();

  late int toolUserId;
  ToolUser? toolUser;
  // String? firstName;
  // String? lastName;
  // String? avatarImagePath;
  // int? phoneNumber;
  // String? frontNationalIdImagePath;
  // String? backNationalIdImagePath;

  // List<Tool> tools = [];
  List<Tool> selectedTools = [];
  bool isAnyToolSelected = false;

  void initState(int toolUserId) async {
    this.toolUserId = toolUserId;
    await fetchToolUser(this.toolUserId);
  }

  void selectTool(Tool tool) {
    isAnyToolSelected = true;
    selectedTools.add(tool);
    rebuildUi();
  }

  void deselectTool(Tool tool) {
    selectedTools.remove(tool);
    if (selectedTools.isEmpty) isAnyToolSelected = false;
    rebuildUi();
  }

  void deselectAllTools() {
    selectedTools.clear();
    isAnyToolSelected = false;
    rebuildUi();
  }

  Future fetchToolUser(int toolUserId) async {
    // Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    ToolUser? toolUser = await runBusyFuture(_toolUsersRepoImp.getToolUserByOrNull(toolUserId));
    this.toolUser = toolUser;
  }

  // void showDialog(DialogType dialogType) async {
  //   var response = await _dialogService.showCustomDialog(
  //     variant: dialogType,
  //     data: 'passed data',
  //   );
  // }

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
      await _toolUsersRepoImp.updateToolUserFirstName(firstName, toolUserId);
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
      await _toolUsersRepoImp.updateToolUserLastName(lastName, toolUserId);
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
      await _toolUsersRepoImp.updateToolUserPhoneNUmber(phoneNumber, toolUserId);
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
  }

  void showSelectedToolSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.selectTool,
    );
  }

  /// the ImageType parameter determines what image will be fetched/displayed/updated in the ImageView
  void navigateToImageView({required ImageType imageType}) async {
    switch (imageType) {
      case ImageType.toolUserImage:
        // since the ImageView is dynamic, you need to provide it with an toolId and a ImageType as a record in order to display/fetch/update the appropriate image(in this case tool image)
        await _navigationService.navigateToImageView(idImageTypeGroup: (id: toolUserId, imageType: ImageType.toolUserImage));
        break;
      case ImageType.frontNationalIdImage:
        // since the ImageView is dynamic, you need to provide it with an toolId and a ImageType as a record in order to display/fetch/update the appropriate image(in this case tool image)
        await _navigationService.navigateToImageView(idImageTypeGroup: (id: toolUserId, imageType: ImageType.frontNationalIdImage));
        break;
      case ImageType.backNationalIdImage:
        // since the ImageView is dynamic, you need to provide it with an toolId and a ImageType as a record in order to display/fetch/update the appropriate image(in this case tool image)
        await _navigationService.navigateToImageView(idImageTypeGroup: (id: toolUserId, imageType: ImageType.frontNationalIdImage));
        break;
      default:
        throw 'The imageType should be either: ImageType.toolUserImage or  ImageType.frontNationalIdImage or  ImageType.frontNationalIdImage but $imageType was received';
    }
    // the user might update one of toolUserImage or frontNationalIdImage or backNationalIdImage, we refetch the tool user data to display the new image if it was changed
    await fetchToolUser(toolUserId);
  }

  void disassociateTools() {
    // implement disassociateTool functionality
    // probably call the repository function and pass the selectedTool(s) to be disassociated
    print('functionality to disassociate tool(s) in the selectedTools list');
  }

  void disassociateTool(Tool tool) {
    print(tool);
    print('functionality to disassociate a tool');
  }

  void navigateBackToToolUsers() async {
    // the future delay code is quick fix if its not here for some reason an error get thrown when i update an image and quickly navigate back to the previous screen.
    // Error: Cannot retrieve length of file, path = <image path> (OS Error: No such file or directory, errno = 2).
    // Where the <image path> is the path of the a new image.
    // The duration cant be less than 1 seconds.
    await Future.delayed(const Duration(seconds: 1));
    _navigationService.back();
  }
}
