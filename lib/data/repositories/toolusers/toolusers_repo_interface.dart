import 'package:tools_rental_management/data/data_models/tooluser.dart';

abstract class ToolUsersRepo {
  Future<int> insertToolUser(ToolUser toolUser);
  Future<ToolUser> updateToolUser(ToolUser toolUser);
  Future<ToolUser?> getToolUserByOrNull(int toolUserId);
  Future<List<ToolUser>?> getAllToolUsersOrNull();
  Future<int> deleteToolUserById(int toolUserId);
  Future<int> deleteAllToolUsers();
}
