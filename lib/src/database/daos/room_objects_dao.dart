import 'dart:math';

import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/room_objects.dart';

part 'room_objects_dao.g.dart';

/// The room objects DAO.
@DriftAccessor(tables: [RoomObjects])
class RoomObjectsDao extends DatabaseAccessor<Database>
    with _$RoomObjectsDaoMixin {
  /// Create an instance.
  RoomObjectsDao(super.db);

  /// Create a new row.
  Future<RoomObject> createRoomObject({
    required final Room location,
    required final String name,
    required final String description,
    required final Point<int> coordinates,
  }) =>
      db.managers.roomObjects.createReturning(
        (final o) => o(
          locationId: location.id,
          name: name,
          description: description,
          x: coordinates.x,
          y: coordinates.y,
        ),
      );

  /// Update [roomObject].
  Future<RoomObject> editRoomObject({
    required final RoomObject roomObject,
    final String? name,
    final String? description,
    final Point<int>? coordinates,
  }) async {
    final copy = roomObject.copyWith(
      name: name ?? roomObject.name,
      description: description ?? roomObject.description,
      x: coordinates?.x ?? roomObject.x,
      y: coordinates?.y ?? roomObject.y,
    );
    await db.managers.roomObjects.replace(copy);
    return copy;
  }

  /// Delete [roomObject].
  Future<int> deleteRoomObject(final RoomObject roomObject) =>
      db.managers.roomObjects.filter((final o) => o.id(roomObject.id)).delete();

  /// Get a single row by [id].
  Future<RoomObject> getRoomObject(final int id) =>
      db.managers.roomObjects.filter((final o) => o.id(id)).getSingle();

  /// Get all the objects in [room].
  Future<List<RoomObject>> getRoomObjects(final Room room) =>
      db.managers.roomObjects
          .filter(
            (final f) => f.locationId.id.equals(room.id),
          )
          .orderBy(
            (final o) => o.x.asc(),
          )
          .get();
}
