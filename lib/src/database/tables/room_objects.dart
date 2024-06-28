import 'package:drift/drift.dart';

import 'mixins.dart';
import 'rooms.dart';

/// An object in a room.
class RoomObjects extends Table
    with IdMixin, NameMixin, DescriptionMixin, CoordinatesMixin {
  @ReferenceName('location')

  /// The ID of the room this object is connected to.
  IntColumn get locationId =>
      integer().references(Rooms, #id, onDelete: KeyAction.cascade)();
}
