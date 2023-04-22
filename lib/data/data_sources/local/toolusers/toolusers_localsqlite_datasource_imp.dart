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
  Future<ToolUser?> getToolUserByIdOrNull(int toolUserId) {
    return _db.toolUsersDao.getToolUserByIdOrNull(toolUserId);
  }

  @override
  Future<List<ToolUser>?> getAllToolUsersOrNull() {
    return _db.toolUsersDao.getAllToolUsersOrNull();
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
