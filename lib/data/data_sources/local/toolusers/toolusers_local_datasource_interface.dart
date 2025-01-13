import 'package:tools_rental_management/data/models/tooluser_model.dart';

abstract class ToolUsersLocalDataSource {
  // inserts
  // return how many rows have been affected
  Future<int> insertToolUser(ToolUserModel toolUser);

  // updates
  // return how many rows have been affected
  Future<int> updateToolUser(ToolUserModel toolUser);
  // return how many rows have been affected
  Future<int> updateToolUserFirstName(String toolUserFirstName, int toolUserId);
  // return how many rows have been affected
  Future<int> updateToolUserLastName(String toolUserLastName, int toolUserId);
  // return how many rows have been affected
  Future<int> updateToolUserPhoneNUmber(
      int toolUserPhoneNumber, int toolUserId);
  // return how many rows have been affected
  Future<int> updateToolUserFrontNationalIdImagePath(
      String toolUserFrontNationalIdImagePath, int toolUserId);
  // return how many rows have been affected
  Future<int> updateToolUserBackNationalIdImagePath(
      String toolUserFrontNationalIdImagePath, int toolUserId);
  // return how many rows have been affected
  Future<int> updateToolUserAvatarImagePath(
      String toolUserAvatarImagePath, int toolUserId);

  // selects
  Future<ToolUserModel?> getToolUserByIdOrNull(int toolUserId);
  Future<String?> getToolUserFirstNameByIdOrNull(int toolUserId);
  Future<String?> getToolUserLastNameByIdOrNull(int toolUserId);
  Future<int?> getToolUserPhoneNumberByIdOrNull(int toolUserId);

  /// return a future that completes with the provided phoneNumber or null if not found
  Future<int?> getToolUserPhoneNumberOrNull(int phoneNumber);
  Future<String?> getToolUserFrontNationalIdImagePathByIdOrNull(int toolUserId);
  Future<String?> getToolUserBackNationalIdImagePathByIdOrNull(int toolUserId);
  Future<String?> getToolUserAvatarImagePathByIdOrNull(int toolUserId);
  Future<List<ToolUserModel>?> getAllToolUsersOrNull();

  // deletes
  Future<int> deleteToolUserById(int toolUserId);
  Future<int> deleteAllToolUsers();
}
