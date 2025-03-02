import 'package:tools_rental_management/domain/entities/user_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/user/user_repo_interface.dart';

class FakeUserRepo extends UserRepo {
  final Map<String, String> _users = {
    'validUser': 'validPassword',
  };

  @override
  Future<UserEntity?> getUserByNameAndPassword({required String username, required String password}) async {
    if (_users[username] == password) {
      return UserEntity(userId: 1, username: username, password: password);
    }
    return null;
  }

  @override
  Future<void> signUp(UserEntity userEntity) async {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
