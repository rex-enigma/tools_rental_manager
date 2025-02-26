import 'package:drift/drift.dart';

// Drift will automatically map query results from the ToolUsers table to instances of the [UserModel] class
// when using the ORM approach for row queries. eg

/* 
  final UserModel user = await db.managers.user.limit(1).getSingle();
  print("UserModelUserName: ${user.username}!");
*/

//But i'm currently using custom statement when querying row so
// i'm not currently using it, its here for remembrance.
//@UseRowClass(UserModel)

class User extends Table {
  IntColumn get userId => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 6, max: 16)();
  TextColumn get password => text().withLength(min: 6, max: 16)();
}
