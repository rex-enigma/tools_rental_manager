import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/user/user_repo_imp.dart';
import 'package:tools_rental_management/domain/entities/user_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/user/user_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/errors/exceptions.dart';

class SignUpUseCase extends UseCase<void, AccountParams> {
  final UserRepo _userRepo;

  SignUpUseCase({UserRepo? userRepo}) : _userRepo = userRepo ?? locator<UserRepoImp>();

  /// throws [UserAlreadyExist] exception if user for the given username and password exist already.
  @override
  Future<void> call(AccountParams p) async {
    UserEntity? userEntity = await _userRepo.getUserByNameAndPassword(username: p.username, password: p.password);
    if (userEntity != null) {
      throw UserAlreadyExist(message: 'user for the given username already exit');
    } else {
      _userRepo.signUp(UserEntity.insert(username: p.username, password: p.password));
    }
  }
}
