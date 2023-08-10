import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:tools_rental_management/data/data_models/tool.dart';

class ToolUserViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  String? firstName;
  String? lastName;
  String? avatarImagePath;
  int? phoneNumber;
  String? frontNationalIdImagePath;
  String? backNationalIdImagePath;

  // test list
  List testTools = ['tool1', 'tool2', 'tool3', 'tool4', 'tool5'];
  List<Tool> tools = [];
  //test selectedTools
  List testSelectedTools = [];
  List<Tool> selectedTools = [];
  bool isAnyToolSelected = false;

  //test long pressing a the customListTile
  void selectTool(String customListTile) {
    isAnyToolSelected = true;
    testSelectedTools.add(customListTile);
    rebuildUi();
  }

  //test removing customListTile from testSelectedTools
  void deselectTool(String customListTile) {
    testSelectedTools.remove(customListTile);
    if (testSelectedTools.isEmpty) isAnyToolSelected = false;
    rebuildUi();
  }

  void deselectAllTools() {
    testSelectedTools.clear();
    isAnyToolSelected = false;
    rebuildUi();
  }

  void showDialog(DialogType dialogType) async {
    var response = await _dialogService.showCustomDialog(
      variant: dialogType,
      data: 'passed data',
    );
  }

  void showToolUserImageCaptureSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.toolUserImageCapture,
    );
  }

  void showSelectedToolSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.selectTool,
    );
  }

  void navigateToToolUserImageView() {
    _navigationService.navigateToToolUserImageView();
  }

  void navigateToFrontNationalIdImageView() async {
    var response = await _navigationService.navigateToFrontNationalIdImageView(); // navigateTo.. functionality works, a value can be returned
    print(response);
  }

  void navigateToBackNationalIdImageView() {
    _navigationService.navigateToBackNationalIdImageView();
  }

  void navigateToToolView() {
    _navigationService.navigateToToolView();
  }

  void disassociateTools() {
    // implement disassociateTool functionality
    // probably call the repository function and pass the selectedTool(s) to be disassociated
    // this function should also be called when an individual tool needs to be disassociated
    print('functionality to disassociate tool');
  }
}
