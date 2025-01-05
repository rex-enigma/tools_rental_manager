import 'package:tools_rental_management/data/models/tooluser_model.dart';

abstract class ToolUsersRepo {
  Future<int> insertToolUser(ToolUser toolUser);

  Future<ToolUser> updateToolUser(ToolUser toolUser);
  // update and returns the updated value
  Future<String?> updateToolUserFirstName(String toolUserFirstName, int toolUserId);
  // update and returns the updated value
  Future<String?> updateToolUserLastName(String toolUserLastName, int toolUserId);
  // update and returns the updated value
  Future<int?> updateToolUserPhoneNUmber(int toolUserPhoneNumber, int toolUserId);
  // update and returns the updated value
  Future<String?> updateToolUserFrontNationalIdImagePath(String toolUserFrontNationalIdImagePath, int toolUserId);
  // update and returns the updated value
  Future<String?> updateToolUserBackNationalIdImagePath(String toolUserFrontNationalIdImagePath, int toolUserId);
  // update and returns the updated value
  Future<String?> updateToolUserAvatarImagePath(String toolUserAvatarImagePath, int toolUserId);

  Future<ToolUser?> getToolUserByOrNull(int toolUserId);
  Future<String?> getToolUserFirstNameByIdOrNull(int toolUserId);
  Future<String?> getToolUserLastNameByIdOrNull(int toolUserId);
  Future<int?> getToolUserPhoneNumberByIdOrNull(int toolUserId);

  /// return a future that completes with the provided phoneNumber or null if not found
  Future<int?> getToolUserPhoneNumberOrNull(int phoneNumber);
  Future<String?> getToolUserFrontNationalIdImagePathByIdOrNull(int toolUserId);
  Future<String?> getToolUserBackNationalIdImagePathByIdOrNull(int toolUserId);
  Future<String?> getToolUserAvatarImagePathByIdOrNull(int toolUserId);
  Future<List<ToolUser>?> getAllToolUsersOrNull();

  Future<int> deleteToolUserById(int toolUserId);
  Future<int> deleteAllToolUsers();
}
