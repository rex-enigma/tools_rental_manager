import 'package:tools_rental_management/data/data_models/tooluser.dart';

abstract class ToolUsersLocalDataSource {
  // inserts
  // return how many rows have been affected
  Future<int> insertToolUser(ToolUser toolUser);

  // updates
  // return how many rows have been affected
  Future<int> updateToolUser(ToolUser toolUser);
  // return how many rows have been affected
  Future<int> updateToolUserFirstName(String toolUserFirstName, int toolUserId);
  // return how many rows have been affected
  Future<int> updateToolUserLastName(String toolUserLastName, int toolUserId);
  // return how many rows have been affected
  Future<int> updateToolUserPhoneNUmber(int toolUserPhoneNumber, int toolUserId);
  // return how many rows have been affected
  Future<int> updateToolUserFrontNationalIdImagePath(String toolUserFrontNationalIdImagePath, int toolUserId);
  // return how many rows have been affected
  Future<int> updateToolUserBackNationalIdImagePath(String toolUserFrontNationalIdImagePath, int toolUserId);
  // return how many rows have been affected
  Future<int> updateToolUserAvatarImagePath(String toolUserAvatarImagePath, int toolUserId);

  // selects
  Future<ToolUser?> getToolUserByIdOrNull(int toolUserId);
  Future<String?> getToolUserFirstNameByIdOrNull(int toolUserId);
  Future<String?> getToolUserLastNameByIdOrNull(int toolUserId);
  Future<int?> getToolUserPhoneNumberByIdOrNull(int toolUserId);
  Future<String?> getToolUserFrontNationalIdImagePathByIdOrNull(int toolUserId);
  Future<String?> getToolUserBackNationalIdImagePathByIdOrNull(int toolUserId);
  Future<String?> getToolUserAvatarImagePathByIdOrNull(int toolUserId);
  Future<List<ToolUser>?> getAllToolUsersOrNull();

  // deletes
  Future<int> deleteToolUserById(int toolUserId);
  Future<int> deleteAllToolUsers();
}
