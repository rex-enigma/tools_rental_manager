import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';

class ToolCreatorSheetModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  String? _toolImagePath;

  String? get toolImagePath => _toolImagePath;

  void showToolImageCaptureSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.toolImageCapture,
    );
  }
}
