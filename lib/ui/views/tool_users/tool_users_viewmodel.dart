import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/data_models/tooluser.dart';
import 'package:tools_rental_management/ui/views/tools/tools_viewmodel.dart';

class ToolUsersViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  /// toolUser search text form field toggle
  bool _showAppBarSearchField = false;
  List<ToolUser> toolUsers = testToolUsers; // create an empty list if there aren't any tool users in the database
  List<ToolUser> filteredToolUsers = [];
  void initState() {
    // initialize toolUsers

    filteredToolUsers = [...toolUsers];
  }

  bool get showAppBarSearchField => _showAppBarSearchField;

  set showAppBarSearchField(bool value) {
    _showAppBarSearchField = value;
    rebuildUi();
  }

  // search for a tool user by there name
  void searchToolUser(String query) {
    filteredToolUsers = toolUsers.where((toolUser) {
      String toolUserName = '${toolUser.firstName} ${toolUser.lastName}';
      return toolUserName.toLowerCase().contains(query.toLowerCase());
    }).toList();
    rebuildUi();
  }

  void resetFilteredToolUsersToDefault() {
    filteredToolUsers = [...toolUsers];
    rebuildUi();
  }

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

List<ToolUser> testToolUsers = [
  ToolUser(
    toolUserId: 1,
    firstName: 'john',
    lastName: 'doe',
    frontNationalIdImagePath: '',
    backNationalIdImagePath: '',
    avatarImagePath: '',
    phoneNumber: 0110000000,
    countryCallingCode: 254,
  ),
  ToolUser(
    toolUserId: 2,
    firstName: 'mark',
    lastName: 'dew',
    frontNationalIdImagePath: '',
    backNationalIdImagePath: '',
    avatarImagePath: '',
    phoneNumber: 011000000,
    countryCallingCode: 254,
    tools: [testTools[0], testTools[1], testTools[2], testTools[3]], // just for testing
  ),
  ToolUser(
    toolUserId: 3,
    firstName: 'john',
    lastName: 'doe',
    frontNationalIdImagePath: '',
    backNationalIdImagePath: '',
    avatarImagePath: '',
    phoneNumber: 0110000000,
    countryCallingCode: 254,
    tools: [testTools[4]],
  ),
  ToolUser(
    toolUserId: 4,
    firstName: 'john',
    lastName: 'doe',
    frontNationalIdImagePath: '',
    backNationalIdImagePath: '',
    avatarImagePath: '',
    phoneNumber: 0110000000,
    countryCallingCode: 254,
    tools: [testTools[5], testTools[6]],
  ),
  ToolUser(
    toolUserId: 5,
    firstName: 'john',
    lastName: 'doe',
    frontNationalIdImagePath: '',
    backNationalIdImagePath: '',
    avatarImagePath: '',
    phoneNumber: 0110000000,
    countryCallingCode: 254,
    tools: [testTools[7]],
  ),
  ToolUser(
    toolUserId: 6,
    firstName: 'andrew',
    lastName: 'saf',
    frontNationalIdImagePath: '',
    backNationalIdImagePath: '',
    avatarImagePath: '',
    phoneNumber: 0110000000,
    countryCallingCode: 254,
    tools: [testTools[8]],
  ),
  ToolUser(
    toolUserId: 7,
    firstName: 'john',
    lastName: 'doe',
    frontNationalIdImagePath: '',
    backNationalIdImagePath: '',
    avatarImagePath: '',
    phoneNumber: 0110000000,
    countryCallingCode: 254,
    tools: [testTools[9]],
  ),
  ToolUser(
    toolUserId: 8,
    firstName: 'antony',
    lastName: 'doe',
    frontNationalIdImagePath: '',
    backNationalIdImagePath: '',
    avatarImagePath: '',
    phoneNumber: 0110000000,
    countryCallingCode: 254,
    tools: [testTools[10]],
  ),
  ToolUser(
    toolUserId: 9,
    firstName: 'jasper',
    lastName: 'ray',
    frontNationalIdImagePath: '',
    backNationalIdImagePath: '',
    avatarImagePath: '',
    phoneNumber: 0110000000,
    countryCallingCode: 254,
  ),
  ToolUser(
    toolUserId: 10,
    firstName: 'john',
    lastName: 'doe',
    frontNationalIdImagePath: '',
    backNationalIdImagePath: '',
    avatarImagePath: '',
    phoneNumber: 0110000000,
    countryCallingCode: 254,
  ),
  ToolUser(
    toolUserId: 11,
    firstName: 'jane',
    lastName: 'may',
    frontNationalIdImagePath: '',
    backNationalIdImagePath: '',
    avatarImagePath: '',
    phoneNumber: 0110000000,
    countryCallingCode: 254,
  ),
];
