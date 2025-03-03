import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:tools_rental_management/database/toolusers/toolusers_dao.dart';
import 'package:tools_rental_management/database/toolusers/toolusers_table.dart';
import 'package:tools_rental_management/database/tools/tools_dao.dart';
import 'package:tools_rental_management/database/tools/tools_table.dart';
import 'package:tools_rental_management/database/user/user_dao.dart';
import 'package:tools_rental_management/database/user/user_table.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/currency.dart';
import 'package:tools_rental_management/enums/status.dart';

part 'app_database.g.dart';

@DriftDatabase(
    tables: [Tools, ToolUsers, User], daos: [ToolUsersDao, ToolsDao, UserDao])
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor
  AppDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from == 1 && to == 2) {
            await migrator.createTable(user);
          }
        },
        onCreate: (migrator) async => await migrator.createAll(),
      );
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'torenmanDb.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
