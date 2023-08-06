import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/data_models/tooluser.dart';
import 'package:tools_rental_management/data/data_sources/local/toolusers/toolusers_local_datasource_interface.dart';
import 'package:tools_rental_management/data/data_sources/local/toolusers/toolusers_localsqlite_datasource_imp.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_interface.dart';

class ToolUsersRepoImp implements ToolUsersRepo {
  late ToolUsersLocalDataSource _toolUsersLocalDataSource;

  ToolUsersRepoImp({ToolUsersLocalDataSource? toolUsersLocalDataSource}) {
    _toolUsersLocalDataSource = toolUsersLocalDataSource ??
        locator.get<ToolUsersLocalSqliteDbDataSource>();
  }
  @override
  Future<int> insertToolUser(ToolUser toolUser) {
    return _toolUsersLocalDataSource.insertToolUser(toolUser);
  }

  // update and return the updated toolUser.
  @override
  Future<ToolUser> updateToolUser(ToolUser toolUser) async {
    await _toolUsersLocalDataSource.updateToolUser(toolUser);
    ToolUser? userOfTool = await getToolUserByOrNull(toolUser.toolUserId!);
    return userOfTool!;
  }

  @override
  Future<ToolUser?> getToolUserByOrNull(int toolUserId) {
    return _toolUsersLocalDataSource.getToolUserByIdOrNull(toolUserId);
  }

  @override
  Future<List<ToolUser>?> getAllToolUsersOrNull() {
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

// i think i should add the functionalities to return only individual pieces of data of a tool user
// incase their is a view that only need a piece of the tool user's data instead of the entire/whole tool user's data
