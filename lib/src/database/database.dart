import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'daos/room_objects_dao.dart';
import 'daos/rooms_dao.dart';
import 'daos/worlds_dao.dart';
import 'tables/room_exits.dart';
import 'tables/room_objects.dart';
import 'tables/rooms.dart';
import 'tables/worlds.dart';

part 'database.g.dart';

/// The database to use.
@DriftDatabase(
  tables: [
    Rooms,
    Worlds,
    RoomObjects,
    RoomExits,
  ],
  daos: [
    WorldsDao,
    RoomsDao,
    RoomObjectsDao,
  ],
)
class Database extends _$Database {
  /// Create an instance.
  Database({final bool useMemory = false})
      : super(
          useMemory
              ? NativeDatabase.memory()
              : LazyDatabase(
                  () async {
                    final documentsDirectory =
                        await getApplicationDocumentsDirectory();
                    final fullPath =
                        path.join(documentsDirectory.path, 'ai_halls');
                    final directory = Directory(fullPath);
                    if (!directory.existsSync()) {
                      directory.createSync(recursive: true);
                    }
                    final file = File(path.join(directory.path, 'db.sqlite3'));
                    return NativeDatabase(file);
                  },
                ),
        );

  /// The schema version.
  @override
  int get schemaVersion => 1;

  /// Migrate the database.
  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (final details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
        onCreate: (final m) async {
          await m.createAll();
        },
        onUpgrade: (final m, final from, final to) async {},
      );
}
