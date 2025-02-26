import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/data_sources/local/user/user_local_datasource_interface.dart';
import 'package:tools_rental_management/data/models/user_model.dart';
import 'package:tools_rental_management/database/app_database.dart';

class UserLocalSqliteDatasource implements UserLocalDatasource {
  final AppDatabase _db = locator<AppDatabase>();

  @override
  Future<UserModel?> getUserByNameAndPassword(
      {required String username, required String password}) {
    return _db.userDao
        .getUserByNameAndPassword(username: username, password: password);
  }

  @override
  Future signUp(UserModel userModel) {
    return _db.userDao.signUp(userModel);
  }
}
