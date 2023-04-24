import 'package:drift/drift.dart';
import 'package:tools_rental_management/data/data_models/tool.dart';
import 'package:tools_rental_management/database/toolusers/toolusers_table.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/currency.dart';
import 'package:tools_rental_management/enums/status.dart';

@UseRowClass(Tool)
// we need to use textEnum<Type>()() for currency,category and status when declaring the corresponding columns in the Tools table so that drift can
// implicitly convert the enum field values in our Tool data class to string for storage.

// we also need to use dateTime()() for boughtAt when declaring the corresponding column in the Tools table so that drift can
// implicitly convert the DateTime field(boughtAt) value in our Tool data class to integer for storage.

// We do all this to satisfy drift but we are not going to us drift fluent api for database manipulation, instead we are going to
// us custom sql queries where the implicit conversions 'wont matter for now'.
class Tools extends Table {
  IntColumn get toolId => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 4, max: 18)();
  DateTimeColumn get boughtAt => dateTime()();
  IntColumn get purchasedPrice => integer()();
  IntColumn get rate => integer()();
  IntColumn get rentCount => integer()();
  TextColumn get currency => textEnum<Currency>()();
  TextColumn get category => textEnum<Category>()();
  TextColumn get toolImagePath => text()();
  IntColumn get toolUniqueId => integer().unique()();
  // on the reference method, onDelete value is set to KeyAction.setNull so that when the parent referenced
  // column is deleted, tool_user_id column will be set to null.(tool de-touching from the deleted toolUser).
  IntColumn get toolUserId => integer().nullable().references(ToolUsers, #toolUserId, onDelete: KeyAction.setNull)();
  TextColumn get status => textEnum<Status>()();
}
