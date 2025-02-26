import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:tools_rental_management/app/app.snackbars.dart';
import 'package:tools_rental_management/domain/entities/tooluser_entity.dart';
import 'package:tools_rental_management/domain/usecases/add_tool_user_usecase.dart';
import 'package:tools_rental_management/domain/usecases/delete_tool_user_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_all_tool_users_usecase.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class ToolUsersViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  final BottomSheetService _bottomSheetService;
  final SnackbarService _snackbarService;
  final DialogService _dialogService;
  final UseCase<int, AddToolUserParam> _addToolUserUseCase;
  final UseCase<List<ToolUserEntity>?, NoParams> _getAllToolUsersUseCase;
  final UseCase<int, ToolUserIdParam> _deleteToolUserUseCase;

  ToolUsersViewModel(
      {NavigationService? navigationService,
      BottomSheetService? bottomSheetService,
      DialogService? dialogService,
      SnackbarService? snackbarService,
      UseCase<int, AddToolUserParam>? addToolUserUseCase,
      UseCase<List<ToolUserEntity>?, NoParams>? getAllToolUsersUseCase,
      UseCase<int, ToolUserIdParam>? deleteToolUserUseCase})
      : _navigationService = navigationService ?? locator<NavigationService>(),
        _bottomSheetService = bottomSheetService ?? locator<BottomSheetService>(),
        _snackbarService = snackbarService ?? locator<SnackbarService>(),
        _dialogService = dialogService ?? locator<DialogService>(),
        _addToolUserUseCase = addToolUserUseCase ?? locator<AddToolUserUseCase>(),
        _getAllToolUsersUseCase = getAllToolUsersUseCase ?? locator<GetAllToolUsersUseCase>(),
        _deleteToolUserUseCase = deleteToolUserUseCase ?? locator<DeleteToolUserUseCase>();

  /// toolUser search text form field toggle
  bool _showAppBarSearchField = false;
  List<ToolUserEntity> toolUsers = []; // create an empty list if there aren't any tool users in the database
  List<ToolUserEntity> filteredToolUsers = [];
  void initState() async {
    List<ToolUserEntity>? toolUsersOrNull = await _fetchAllToolUsers();
    // print(toolUsersOrNull);
    addToToolUser(toolUsersOrNull);
    addToFilteredToolUsers();
  }

  bool get showAppBarSearchField => _showAppBarSearchField;

  set showAppBarSearchField(bool value) {
    _showAppBarSearchField = value;
    rebuildUi();
  }

  // add toolUser fetched from the database to this.toolUsers list
  void addToToolUser(List<ToolUserEntity>? toolUsers) {
    if (toolUsers != null) {
      // order the toolUsers in descending order
      // since the toolUserIds are sequentially incremented, its guaranteed that the newly added toolUser to the database will have a larger toolUserId value
      // and therefore we want it get display at the top
      toolUsers.sort((toolUserA, toolUserB) => toolUserB.toolUserId!.compareTo(toolUserA.toolUserId!));
      this.toolUsers = [...toolUsers];
    } else {
      this.toolUsers = [];
    }
    // this.toolUsers = toolUsers == null ? [] : [...toolUsers];
  }

  void addToFilteredToolUsers() {
    // ui uses filteredToolUsers list to display the tool user
    filteredToolUsers = [...toolUsers];
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

  void updateToolUsers() async {
    List<ToolUserEntity>? toolUsersOrNull = await _fetchAllToolUsers();
    addToToolUser(toolUsersOrNull);
    addToFilteredToolUsers();
  }

  // we are using runBusyFuture function so that it can allow as to check if our viewModel is busy through the isBusy property handling a future function
  Future<int> _insertNewToolUser(ToolUserEntity newToolUser) async {
    // Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    return runBusyFuture(_addToolUserUseCase(AddToolUserParam(toolUserEntity: newToolUser)));
  }

  Future<List<ToolUserEntity>?> _fetchAllToolUsers() async {
    // Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    return runBusyFuture(_getAllToolUsersUseCase(NoParams()));
  }

  void deleteToolUser(ToolUserEntity toolUser) async {
    // check if the toolUser is using any tool, if the toolUser.tools is null it means the toolUser is not using any tools so delete him from database
    if (toolUser.toolEntities == null) {
      // Sets busy to true before starting future and sets it to false after executing
      // the ui will be rebuild in both situations
      await runBusyFuture(_deleteToolUserUseCase(ToolUserIdParam(toolUserId: toolUser.toolUserId!)));

      // once the deletion is complete, show a snackbar message to the user
      _snackbarService.showCustomSnackBar(message: '${toolUser.firstName} ${toolUser.lastName} deleted successfully', variant: SnackbarType.success);
      updateToolUsers();
    }
  }

  void showToolDeleteConfirmDialog(ToolUserEntity toolUser) async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.deleteConfirm,
      // pass the first and last name of the tool user to be displayed on the DeleteConfirmDialog
      data: '${toolUser.firstName} ${toolUser.lastName}',
    );

    // response.confirm will be true if the user has confirms the tool user deletion by pressing confirm or false when the user has pressed cancel
    if (response?.confirmed == true) {
      deleteToolUser(toolUser);
    }
  }

  void showToolUserCreatorBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.toolUserCreator,
      isScrollControlled: true,
      // setting it to false will make sure  [SafeArea] won't be ignored when constructing bottomSheet, .
      ignoreSafeArea: false,
    );

    // response.data is not null when a user has constructed a new tool user
    if (response?.data != null) {
      ToolUserEntity newToolUser = response!.data;
      await _insertNewToolUser(newToolUser);
      _snackbarService.showCustomSnackBar(message: '${newToolUser.firstName} created successfully', variant: SnackbarType.success);
      List<ToolUserEntity>? toolUsersOrNull = await _fetchAllToolUsers();
      // print(toolUsersOrNull);
      // this will add to the toolUsers? gotten from the database to the toolUsers property list
      addToToolUser(toolUsersOrNull);
      addToFilteredToolUsers();
    }
  }

  void navigateToToolUser(int toolUserId) async {
    // pass the toolUserId to ToolUserView for it to be use to fetch all the data for the toolUser with that id
    await _navigationService.navigateToToolUserView(toolUserId: toolUserId);
    // the user might have updated the toolUser, so we run updateToolUsers to refetch all the toolUsers to display any updates that might have been done on a toolUser { i know we should only fetch that updated toolUser instead of the all the toolUsers}
    updateToolUsers();
  }
}

// List<ToolUserEntity> testToolUsers = [
//   ToolUserEntity(
//     toolUserId: 1,
//     firstName: 'john',
//     lastName: 'doe',
//     frontNationalIdImagePath: '',
//     backNationalIdImagePath: '',
//     avatarImagePath: '',
//     phoneNumber: 0110000000,
//     countryCallingCode: 254,
//   ),
//   ToolUserEntity(
//     toolUserId: 2,
//     firstName: 'mark',
//     lastName: 'dew',
//     frontNationalIdImagePath: '',
//     backNationalIdImagePath: '',
//     avatarImagePath: '',
//     phoneNumber: 011000000,
//     countryCallingCode: 254,
//     tools: [testTools[0], testTools[1], testTools[2], testTools[3]], // just for testing
//   ),
//   ToolUserEntity(
//     toolUserId: 3,
//     firstName: 'john',
//     lastName: 'doe',
//     frontNationalIdImagePath: '',
//     backNationalIdImagePath: '',
//     avatarImagePath: '',
//     phoneNumber: 0110000000,
//     countryCallingCode: 254,
//     tools: [testTools[4]],
//   ),
//   ToolUserEntity(
//     toolUserId: 4,
//     firstName: 'john',
//     lastName: 'doe',
//     frontNationalIdImagePath: '',
//     backNationalIdImagePath: '',
//     avatarImagePath: '',
//     phoneNumber: 0110000000,
//     countryCallingCode: 254,
//     tools: [testTools[5], testTools[6]],
//   ),
//   ToolUserEntity(
//     toolUserId: 5,
//     firstName: 'john',
//     lastName: 'doe',
//     frontNationalIdImagePath: '',
//     backNationalIdImagePath: '',
//     avatarImagePath: '',
//     phoneNumber: 0110000000,
//     countryCallingCode: 254,
//     tools: [testTools[7]],
//   ),
//   ToolUserEntity(
//     toolUserId: 6,
//     firstName: 'andrew',
//     lastName: 'saf',
//     frontNationalIdImagePath: '',
//     backNationalIdImagePath: '',
//     avatarImagePath: '',
//     phoneNumber: 0110000000,
//     countryCallingCode: 254,
//     tools: [testTools[8]],
//   ),
//   ToolUserEntity(
//     toolUserId: 7,
//     firstName: 'john',
//     lastName: 'doe',
//     frontNationalIdImagePath: '',
//     backNationalIdImagePath: '',
//     avatarImagePath: '',
//     phoneNumber: 0110000000,
//     countryCallingCode: 254,
//     tools: [testTools[9]],
//   ),
//   ToolUserEntity(
//     toolUserId: 8,
//     firstName: 'antony',
//     lastName: 'doe',
//     frontNationalIdImagePath: '',
//     backNationalIdImagePath: '',
//     avatarImagePath: '',
//     phoneNumber: 0110000000,
//     countryCallingCode: 254,
//     tools: [testTools[10]],
//   ),
//   ToolUserEntity(
//     toolUserId: 9,
//     firstName: 'jasper',
//     lastName: 'ray',
//     frontNationalIdImagePath: '',
//     backNationalIdImagePath: '',
//     avatarImagePath: '',
//     phoneNumber: 0110000000,
//     countryCallingCode: 254,
//   ),
//   ToolUserEntity(
//     toolUserId: 10,
//     firstName: 'john',
//     lastName: 'doe',
//     frontNationalIdImagePath: '',
//     backNationalIdImagePath: '',
//     avatarImagePath: '',
//     phoneNumber: 0110000000,
//     countryCallingCode: 254,
//   ),
//   ToolUserEntity(
//     toolUserId: 11,
//     firstName: 'jane',
//     lastName: 'may',
//     frontNationalIdImagePath: '',
//     backNationalIdImagePath: '',
//     avatarImagePath: '',
//     phoneNumber: 0110000000,
//     countryCallingCode: 254,
//   ),
// ];
