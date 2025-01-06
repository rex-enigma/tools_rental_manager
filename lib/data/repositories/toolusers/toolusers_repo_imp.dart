import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/models/tooluser_model.dart';
import 'package:tools_rental_management/data/data_sources/local/toolusers/toolusers_local_datasource_interface.dart';
import 'package:tools_rental_management/data/data_sources/local/toolusers/toolusers_localsqlite_datasource_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';

class ToolUsersRepoImp implements ToolUsersRepo {
  late ToolUsersLocalDataSource _toolUsersLocalDataSource;

  ToolUsersRepoImp({ToolUsersLocalDataSource? toolUsersLocalDataSource}) {
    _toolUsersLocalDataSource = toolUsersLocalDataSource ?? locator<ToolUsersLocalSqliteDbDataSource>();
  }
  @override
  Future<int> insertToolUser(ToolUserModel toolUser) {
    return _toolUsersLocalDataSource.insertToolUser(toolUser);
  }

  // update and return the updated toolUser.
  /// The tool user passed as argument cant contain null value for ToolUser.tooUserId property because
  ///  for it to be updated it must exist in the database
  @override
  Future<ToolUserModel> updateToolUser(ToolUserModel toolUser) async {
    if (toolUser.toolUserId == null) {
      throw 'the [ToolUser] is missing a toolUserId, hence unable to update the given toolUser: $toolUser';
    }
    await _toolUsersLocalDataSource.updateToolUser(toolUser);
    ToolUserModel? userOfTool = await getToolUserByOrNull(toolUser.toolUserId!);
    return userOfTool!;
  }

  /// update and return the updated tool user avatar_image_path for the given toolUserId
  @override
  Future<String?> updateToolUserAvatarImagePath(String toolUserAvatarImagePath, int toolUserId) async {
    await _toolUsersLocalDataSource.updateToolUserAvatarImagePath(toolUserAvatarImagePath, toolUserId);
    return _toolUsersLocalDataSource.getToolUserAvatarImagePathByIdOrNull(toolUserId);
  }

  /// update and return the updated tool user first_name for the given toolUserId
  @override
  Future<String?> updateToolUserFirstName(String toolUserFirstName, int toolUserId) async {
    await _toolUsersLocalDataSource.updateToolUserFirstName(toolUserFirstName, toolUserId);
    return _toolUsersLocalDataSource.getToolUserFirstNameByIdOrNull(toolUserId);
  }

  /// update and return the updated tool user front_national_id_image_path for the given toolUserId
  @override
  Future<String?> updateToolUserFrontNationalIdImagePath(String toolUserFrontNationalIdImagePath, int toolUserId) async {
    await _toolUsersLocalDataSource.updateToolUserFrontNationalIdImagePath(toolUserFrontNationalIdImagePath, toolUserId);
    return _toolUsersLocalDataSource.getToolUserFrontNationalIdImagePathByIdOrNull(toolUserId);
  }

  /// update and return the updated tool user last_name for the given toolUserId
  @override
  Future<String?> updateToolUserLastName(String toolUserLastName, int toolUserId) async {
    await _toolUsersLocalDataSource.updateToolUserLastName(toolUserLastName, toolUserId);
    return _toolUsersLocalDataSource.getToolUserLastNameByIdOrNull(toolUserId);
  }

  /// update and return the updated tool user phone_number for the given toolUserId
  @override
  Future<int?> updateToolUserPhoneNUmber(int toolUserPhoneNumber, int toolUserId) async {
    await _toolUsersLocalDataSource.updateToolUserPhoneNUmber(toolUserPhoneNumber, toolUserId);
    return _toolUsersLocalDataSource.getToolUserPhoneNumberByIdOrNull(toolUserId);
  }

  /// update and return the updated tool user back_national_id_image_path for the given toolUserId
  @override
  Future<String?> updateToolUserBackNationalIdImagePath(String toolUserFrontNationalIdImagePath, int toolUserId) async {
    await _toolUsersLocalDataSource.updateToolUserBackNationalIdImagePath(toolUserFrontNationalIdImagePath, toolUserId);
    return _toolUsersLocalDataSource.getToolUserBackNationalIdImagePathByIdOrNull(toolUserId);
  }

  @override
  Future<ToolUserModel?> getToolUserByOrNull(int toolUserId) {
    return _toolUsersLocalDataSource.getToolUserByIdOrNull(toolUserId);
  }

  @override
  Future<String?> getToolUserAvatarImagePathByIdOrNull(int toolUserId) {
    return _toolUsersLocalDataSource.getToolUserAvatarImagePathByIdOrNull(toolUserId);
  }

  @override
  Future<String?> getToolUserBackNationalIdImagePathByIdOrNull(int toolUserId) {
    return _toolUsersLocalDataSource.getToolUserBackNationalIdImagePathByIdOrNull(toolUserId);
  }

  @override
  Future<String?> getToolUserFirstNameByIdOrNull(int toolUserId) {
    return _toolUsersLocalDataSource.getToolUserFirstNameByIdOrNull(toolUserId);
  }

  @override
  Future<String?> getToolUserFrontNationalIdImagePathByIdOrNull(int toolUserId) {
    return _toolUsersLocalDataSource.getToolUserFrontNationalIdImagePathByIdOrNull(toolUserId);
  }

  @override
  Future<String?> getToolUserLastNameByIdOrNull(int toolUserId) {
    return _toolUsersLocalDataSource.getToolUserLastNameByIdOrNull(toolUserId);
  }

  @override
  Future<int?> getToolUserPhoneNumberByIdOrNull(int toolUserId) {
    return _toolUsersLocalDataSource.getToolUserPhoneNumberByIdOrNull(toolUserId);
  }

  @override
  Future<int?> getToolUserPhoneNumberOrNull(int phoneNumber) {
    return getToolUserPhoneNumberOrNull(phoneNumber);
  }

  @override
  Future<List<ToolUserModel>?> getAllToolUsersOrNull() {
    return _toolUsersLocalDataSource.getAllToolUsersOrNull();
  }

  @override
  Future<int> deleteToolUserById(int toolUserId) {
    return _toolUsersLocalDataSource.deleteToolUserById(toolUserId);
  }

  @override
  Future<int> deleteAllToolUsers() {
    return _toolUsersLocalDataSource.deleteAllToolUsers();
  }
}
