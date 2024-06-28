import 'package:drift/drift.dart';

import 'mixins.dart';
import 'rooms.dart';

/// An object in a room.
class RoomObjects extends Table
    with IdMixin, NameMixin, DescriptionMixin, CoordinatesMixin {
  /// The ID of the room this object is connected to.
  @ReferenceName('location')
  IntColumn get locationId =>
      integer().references(Rooms, #id, onDelete: KeyAction.cascade)();
}
