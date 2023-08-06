import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';

class ToolsViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  void showToolCreatorBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.toolCreator,
      isScrollControlled: true,
      // setting it to false will make sure if you use [SafeArea] when constructing bottomSheet, it won't be ignored.
      ignoreSafeArea: false,
      data: 'my passed data',
    );
    print(response?.data);
  }
}
