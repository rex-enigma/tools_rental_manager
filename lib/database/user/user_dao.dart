import 'package:drift/drift.dart';
import 'package:tools_rental_management/data/models/user_model.dart';
import 'package:tools_rental_management/database/app_database.dart';
import 'package:tools_rental_management/database/user/user_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [User])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db);

  Future<int> signUp(UserModel user) {
    return customInsert(
      """INSERT INTO user (
          username, 
          password
        )
        VALUES (
          :username, 
          :password
        )""",
      variables: [
        Variable.withString(user.username),
        Variable.withString(user.password),
      ],
    ).catchError((Object e, StackTrace stackTrace) {
      print('Error: $e, stackTrace: $stackTrace');
      throw Exception(e);
    });
  }

  // Future<UserModel?> login({required String username, required String password}) async {
  //   final userResult = await customSelect(
  //     'SELECT * FROM user WHERE username = :username AND password =:password',
  //     variables: [
  //       Variable.withString(username),
  //       Variable.withString(password)
  //     ],
  //   ).getSingleOrNull().catchError((Object e, StackTrace stackTrace) {
  //     print('Error: $e, stacktrace: $stackTrace');
  //     throw Exception(e);
  //   });

  //   if (userResult == null) return null;

  //   Map<String, dynamic> userMap = userResult.data;

  //   return UserModel.fromMap(userMap);
  // }

// This code is similar to the login, study it
  Future<UserModel?> getUserByNameAndPassword(
      {required String username, required String password}) async {
    final userResult = await customSelect(
      'SELECT * FROM user WHERE username = :username AND password =:password',
      variables: [Variable.withString(username), Variable.withString(password)],
    ).getSingleOrNull().catchError((Object e, StackTrace stackTrace) {
      print('Error: $e, stacktrace: $stackTrace');
      throw Exception(e);
    });

    if (userResult == null) return null;

    Map<String, dynamic> userMap = userResult.data;

    return UserModel.fromMap(userMap);
  }
}
