import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';

class BackNationalIdImageViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  String? backNationalIdImagePath;

  void showNationalIdImageCaptureSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      // title to be used for the ImageCaptureSheet
      title: 'National id image',
      variant: BottomSheetType.imageCapture,
      // send the backNationalIdImagePath to the ImageCaptureSheet for it to be removed if the user has selected one and what to update with a new one
      data: backNationalIdImagePath,
    );
  }
}
