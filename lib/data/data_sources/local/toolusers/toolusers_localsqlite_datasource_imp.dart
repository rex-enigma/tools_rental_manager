import 'package:tools_rental_management/data/data_models/tooluser.dart';
import 'package:tools_rental_management/data/data_sources/local/toolusers/toolusers_local_datasource_interface.dart';
import 'package:tools_rental_management/database/app_database.dart';

// data source class: type of data + type of source + DataSource (toolUsers + localSqlite + DataSource);
// the data source class should only work with one source of data (AppDatabase)
class ToolUsersLocalSqliteDbDataSource implements ToolUsersLocalDataSource {
  final AppDatabase _db = AppDatabase();

  @override
  Future<int> insertToolUser(ToolUser toolUser) {
    return _db.toolUsersDao.insertToolUser(toolUser);
  }

  @override
  Future<int> updateToolUser(ToolUser toolUser) {
    return _db.toolUsersDao.updateToolUser(toolUser);
  }

  @override
  Future<int> updateToolUserAvatarImagePath(String toolUserAvatarImagePath, int toolUserId) {
    return _db.toolUsersDao.updateToolUserAvatarImagePath(toolUserAvatarImagePath, toolUserId);
  }

  @override
  Future<int> updateToolUserFirstName(String toolUserFirstName, int toolUserId) {
    return _db.toolUsersDao.updateToolUserFirstName(toolUserFirstName, toolUserId);
  }

  @override
  Future<int> updateToolUserFrontNationalIdImagePath(String toolUserFrontNationalIdImagePath, int toolUserId) {
    return _db.toolUsersDao.updateToolUserFrontNationalIdImagePath(toolUserFrontNationalIdImagePath, toolUserId);
  }

  @override
  Future<int> updateToolUserBackNationalIdImagePath(String toolUserFrontNationalIdImagePath, int toolUserId) {
    return _db.toolUsersDao.updateToolUserBackNationalIdImagePath(toolUserFrontNationalIdImagePath, toolUserId);
  }

  @override
  Future<int> updateToolUserLastName(String toolUserLastName, int toolUserId) {
    return _db.toolUsersDao.updateToolUserLastName(toolUserLastName, toolUserId);
  }

  @override
  Future<int> updateToolUserPhoneNUmber(int toolUserPhoneNumber, int toolUserId) {
    return _db.toolUsersDao.updateToolUserPhoneNUmber(toolUserPhoneNumber, toolUserId);
  }

  @override
  Future<ToolUser?> getToolUserByIdOrNull(int toolUserId) {
    return _db.toolUsersDao.getToolUserByIdOrNull(toolUserId);
  }

  @override
  Future<List<ToolUser>?> getAllToolUsersOrNull() {
    return _db.toolUsersDao.getAllToolUsersOrNull();
  }

  @override
  Future<String?> getToolUserBackNationalIdImagePathByIdOrNull(int toolUserId) {
    return _db.toolUsersDao.getToolUserBackNationalIdImagePathByIdOrNull(toolUserId);
  }

  @override
  Future<String?> getToolUserFirstNameByIdOrNull(int toolUserId) {
    return _db.toolUsersDao.getToolUserFirstNameByIdOrNull(toolUserId);
  }

  @override
  Future<String?> getToolUserFrontNationalIdImagePathByIdOrNull(int toolUserId) {
    return _db.toolUsersDao.getToolUserFrontNationalIdImagePathByIdOrNull(toolUserId);
  }

  @override
  Future<String?> getToolUserLastNameByIdOrNull(int toolUserId) {
    return _db.toolUsersDao.getToolUserLastNameByIdOrNull(toolUserId);
  }

  @override
  Future<int?> getToolUserPhoneNumberByIdOrNull(int toolUserId) {
    return _db.toolUsersDao.getToolUserPhoneNumberByIdOrNull(toolUserId);
  }

  @override
  Future<int?> getToolUserPhoneNumberOrNull(int phoneNumber) {
    return _db.toolUsersDao.getToolUserPhoneNumberOrNull(phoneNumber);
  }

  @override
  Future<String?> getToolUserAvatarImagePathByIdOrNull(int toolUserId) {
    return _db.toolUsersDao.getToolUserAvatarImagePathByIdOrNull(toolUserId);
  }

  @override
  Future<int> deleteToolUserById(int toolUserId) {
    return _db.toolUsersDao.deleteToolUserById(toolUserId);
  }

  @override
  Future<int> deleteAllToolUsers() {
    return _db.toolUsersDao.deleteAllToolUsers();
  }
}
