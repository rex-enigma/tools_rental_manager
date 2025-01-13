import 'package:tools_rental_management/domain/entities/tooluser_entity.dart';

abstract class ToolUsersRepo {
  Future<int> insertToolUser(ToolUserEntity toolUser);

  Future<ToolUserEntity> updateToolUser(ToolUserEntity toolUser);
  // update and returns the updated value
  Future<String?> updateToolUserFirstName(
      String toolUserFirstName, int toolUserId);
  // update and returns the updated value
  Future<String?> updateToolUserLastName(
      String toolUserLastName, int toolUserId);
  // update and returns the updated value
  Future<int?> updateToolUserPhoneNUmber(
      int toolUserPhoneNumber, int toolUserId);
  // update and returns the updated value
  Future<String?> updateToolUserFrontNationalIdImagePath(
      String toolUserFrontNationalIdImagePath, int toolUserId);
  // update and returns the updated value
  Future<String?> updateToolUserBackNationalIdImagePath(
      String toolUserBackNationalIdImagePath, int toolUserId);
  // update and returns the updated value
  Future<String?> updateToolUserAvatarImagePath(
      String toolUserAvatarImagePath, int toolUserId);

  Future<ToolUserEntity?> getToolUserByIdOrNull(int toolUserId);
  Future<String?> getToolUserFirstNameByIdOrNull(int toolUserId);
  Future<String?> getToolUserLastNameByIdOrNull(int toolUserId);
  Future<int?> getToolUserPhoneNumberByIdOrNull(int toolUserId);

  /// return a future that completes with the provided phoneNumber or null if not found
  Future<int?> getToolUserPhoneNumberOrNull(int phoneNumber);
  Future<String?> getToolUserFrontNationalIdImagePathByIdOrNull(int toolUserId);
  Future<String?> getToolUserBackNationalIdImagePathByIdOrNull(int toolUserId);
  Future<String?> getToolUserAvatarImagePathByIdOrNull(int toolUserId);
  Future<List<ToolUserEntity>?> getAllToolUsersOrNull();

  Future<int> deleteToolUserById(int toolUserId);
  Future<int> deleteAllToolUsers();
}
