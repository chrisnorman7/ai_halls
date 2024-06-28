import 'dart:math';

import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/room_exits.dart';

part 'room_exits_dao.g.dart';

/// The room exits DAO.
@DriftAccessor(tables: [RoomExits])
class RoomExitsDao extends DatabaseAccessor<Database> with _$RoomExitsDaoMixin {
  /// Create an instance.
  RoomExitsDao(super.db);

  /// Create a new row.
  Future<RoomExit> createRoomExit({
    required final Room location,
    required final String name,
    required final String description,
    required final Point<int> coordinates,
  }) =>
      db.managers.roomExits.createReturning(
        (final o) => o(
          locationId: location.id,
          name: name,
          description: description,
          x: coordinates.x,
          y: coordinates.y,
        ),
      );

  /// Update [roomExit].
  Future<RoomExit> editRoomExit({
    required final RoomExit roomExit,
    final String? name,
    final String? description,
    final Point<int>? coordinates,
  }) async {
    final copy = roomExit.copyWith(
      name: name ?? roomExit.name,
      description: description ?? roomExit.description,
      x: coordinates?.x ?? roomExit.x,
      y: coordinates?.y ?? roomExit.y,
    );
    await db.managers.roomExits.replace(copy);
    return copy;
  }

  /// Delete [roomExit].
  Future<int> deleteRoomExit(final RoomExit roomExit) =>
      db.managers.roomExits.filter((final o) => o.id(roomExit.id)).delete();

  /// Get a single row by [id].
  Future<RoomExit> getRoomExit(final int id) =>
      db.managers.roomExits.filter((final o) => o.id(id)).getSingle();
}
