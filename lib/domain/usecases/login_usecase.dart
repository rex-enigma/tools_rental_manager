import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/user/user_repo_imp.dart';
import 'package:tools_rental_management/domain/entities/user_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/user/user_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/errors/exceptions.dart';

class LoginUseCase extends UseCase<UserEntity?, AccountParams> {
  final UserRepo _userRepo;

  LoginUseCase({UserRepo? userRepo}) : _userRepo = userRepo ?? locator<UserRepoImp>();

  /// throws [UserNotFound] exception if user doesn't exist.
  @override
  Future<UserEntity?> call(AccountParams p) async {
    UserEntity? userEntity = await _userRepo.getUserByNameAndPassword(username: p.username, password: p.password);
    if (userEntity == null) throw UserNotFound(message: "User with those credentials doesn't exist");
    return userEntity;
  }
}
