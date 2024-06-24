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
  int get schemaVersion => 4;

  /// Migrate the database.
  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (final details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
        onCreate: (final m) async {
          await m.createAll();
        },
        onUpgrade: (final m, final from, final to) async {
          if (from < 2) {
            await m.addColumn(worlds, worlds.firstRoomId);
            await m.addColumn(rooms, rooms.description);
          }
          if (from < 3) {
            await m.addColumn(rooms, rooms.width);
            await m.addColumn(rooms, rooms.length);
          }
          if (from < 4) {
            await m.createTable(roomObjects);
            await m.createTable(roomExits);
          }
        },
      );
}
