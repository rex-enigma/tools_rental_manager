import 'package:drift/drift.dart';

// Drift will automatically map query results from the ToolUsers table to instances of the [ToolUserModel] class
// when using the ORM approach for row queries. eg

/* 
  final ToolUserModel toolUser = await db.managers.toolUsers.limit(1).getSingle();
  print("ToolUserModelName: ${toolUser.firstName}!");
*/

//But i'm currently using custom statement when querying row so
// i'm not currently using it, its here for remembrance.
//@UseRowClass(ToolUserModel)
class ToolUsers extends Table {
  IntColumn get toolUserId => integer().autoIncrement()();
  TextColumn get firstName => text().withLength(min: 6, max: 16)();
  TextColumn get lastName => text().withLength(min: 6, max: 16)();
  TextColumn get frontNationalIdImagePath => text()();
  TextColumn get backNationalIdImagePath => text()();
  TextColumn get avatarImagePath => text()();
  IntColumn get phoneNumber => integer()();
  IntColumn get countryCallingCode => integer()();
}
