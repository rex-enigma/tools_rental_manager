import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/data_sources/local/user/user_local_datasource_interface.dart';
import 'package:tools_rental_management/data/data_sources/local/user/user_localsqlite_datasource_imp.dart';
import 'package:tools_rental_management/data/models/user_model.dart';
import 'package:tools_rental_management/domain/entities/user_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/user/user_repo_interface.dart';

class UserRepoImp implements UserRepo {
  final UserLocalDatasource _userLocalDatasource;

  UserRepoImp({UserLocalDatasource? userLocalDataSource}) : _userLocalDatasource = userLocalDataSource ?? locator<UserLocalSqliteDatasource>();

  @override
  Future<UserEntity?> getUserByNameAndPassword({required String username, required String password}) async {
    final userModel = await _userLocalDatasource.getUserByNameAndPassword(username: username, password: password);
    return userModel?.toEntity();
  }

  @override
  Future signUp(UserEntity userEntity) {
    final userModel = UserModel.fromEntity(userEntity);
    return _userLocalDatasource.signUp(userModel);
  }
}
