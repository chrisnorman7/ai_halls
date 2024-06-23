import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'daos/worlds_dao.dart';
import 'tables/rooms.dart';
import 'tables/worlds.dart';

part 'database.g.dart';

/// The database to use.
@DriftDatabase(
  tables: [
    Rooms,
    Worlds,
  ],
  daos: [
    WorldsDao,
  ],
)
class Database extends _$Database {
  /// Create an instance.
  Database(final File? file)
      : super(file == null ? NativeDatabase.memory() : NativeDatabase(file));

  /// The schema version.
  @override
  int get schemaVersion => 1;
}
