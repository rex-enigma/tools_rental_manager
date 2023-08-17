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

  List<Tool> tools = [];
  List<Tool> selectedTools = [];
  bool isAnyToolSelected = false;

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
