import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';

class SettingsViewModel extends BaseViewModel {
  final BottomSheetService _bottomSheetService;

  SettingsViewModel({BottomSheetService? bottomSheetService}) : _bottomSheetService = bottomSheetService ?? locator<BottomSheetService>();

  // for testing purposes, delete after use
  void showSelectToolSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.selectTool,
      isScrollControlled: true,
      data: 'passed data',
    );
  }
}
