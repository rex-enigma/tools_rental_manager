import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';

class ToolUserCreatorSheetModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  String? _frontNationalIdImagePath;
  String? _backNationalIdImagePath;
  String? _userImagePath;

  String? get frontNationalIdImagePath => _frontNationalIdImagePath;
  String? get backNationalIdImagePath => _backNationalIdImagePath;
  String? get userImagePath => _userImagePath;

  void showNationalIdImageCaptureSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.nationalIdImageCapture,
    );
  }

  void showToolUserImageCaptureSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.toolUserImageCapture,
    );
  }
}
