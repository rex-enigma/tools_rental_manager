import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';

class ToolUsersViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  void showUserCreatorBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.toolUserCreator,
      isScrollControlled: true,
      // setting it to false will make sure if you use [SafeArea] when constructing bottomSheet, it won't be ignored.
      ignoreSafeArea: false,
    );

    print(response?.data);
  }
}
