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

  void showDialog(DialogType dialogType) async {
    var response = await _dialogService.showCustomDialog(
      variant: dialogType,
      data: 'passed data',
    );
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

  void navigateToImageView() async {
    // since the ImageView is dynamic, you need to provide it with an toolId and a ImageType as a record in order to display/fetch/update the appropriate image(in this case tool image)
    await _navigationService.navigateToImageView(idImageTypeGroup: (id: toolUserId, imageType: ImageType.toolUserImage));
    // the user might update the tool image, we refetch the tool image to display the new image if it was changed
    // the [toolId] am guaranteeing its not null since this viewModel wont be disposed when we navigate to ToolImageView
    await fetchToolUser(toolUserId);
  }

  void navigateToFrontNationalIdImageView() async {
    // var response = await _navigationService
    //     .navigateToFrontNationalIdImageView(); // navigateTo.. functionality works, a value can be returned
    // print(response);
  }

  void navigateToBackNationalIdImageView() {
    // _navigationService.navigateToBackNationalIdImageView();
  }

  // void navigateToToolView() {
  //   _navigationService.navigateToToolView();
  // }

  void disassociateTools() {
    // implement disassociateTool functionality
    // probably call the repository function and pass the selectedTool(s) to be disassociated
    print('functionality to disassociate tool(s) in the selectedTools list');
  }

  void disassociateTool(Tool tool) {
    print(tool);
    print('functionality to disassociate a tool');
  }
}
