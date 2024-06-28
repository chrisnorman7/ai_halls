import 'package:drift/drift.dart';

import 'mixins.dart';
import 'rooms.dart';

/// The room exits table.
class RoomExits extends Table
    with IdMixin, NameMixin, DescriptionMixin, CoordinatesMixin {
  /// The ID of the room this exit resides in.
  @ReferenceName('origin')
  IntColumn get locationId =>
      integer().references(Rooms, #id, onDelete: KeyAction.cascade)();

  /// The ID of the room this exit leads to.
  @ReferenceName('destination')
  IntColumn get destinationId => integer()
      .references(Rooms, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
