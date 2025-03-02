import 'package:tools_rental_management/domain/entities/user_entity.dart';

abstract class UserRepo {
  Future<UserEntity?> getUserByNameAndPassword({required String username, required String password});
  Future<void> signUp(UserEntity userEntity);
}
