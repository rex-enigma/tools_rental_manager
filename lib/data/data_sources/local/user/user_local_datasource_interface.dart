import 'package:tools_rental_management/data/models/user_model.dart';

abstract class UserLocalDatasource {
  Future<UserModel?> getUserByNameAndPassword(
      {required String username, required String password});
  Future signUp(UserModel userModel);
}
