import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';

class ToolUserImageViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  String? toolUserImagePath;

  void showToolUserImageCaptureBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      // title to be used for the ImageCaptureSheet
      title: 'Tool user image',
      variant: BottomSheetType.imageCapture,
      // send the toolUserImagePath to the ImageCaptureSheet for it to be removed if the user has selected one and what to update with a new one
      data: toolUserImagePath,
    );
  }
}
