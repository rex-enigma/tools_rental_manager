import 'package:drift/drift.dart';
import 'package:tools_rental_management/data/data_models/tooluser.dart';

@UseRowClass(ToolUser)
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
