import 'package:tools_rental_management/data/data_models/tooluser.dart';

abstract class ToolUsersLocalDataSource {
  Future<int> insertToolUser(ToolUser toolUser);
  Future<int> updateToolUser(ToolUser toolUser);
  Future<ToolUser?> getToolUserByIdOrNull(int toolUserId);
  Future<List<ToolUser>?> getAllToolUsersOrNull();
  Future<int> deleteToolUserById(int toolUserId);
  Future<int> deleteAllToolUsers();
}
