import 'package:drift/drift.dart';

import 'mixins.dart';
import 'rooms.dart';

/// The room exits table.
class RoomExits extends Table
    with IdMixin, NameMixin, DescriptionMixin, CoordinatesMixin {
  /// The ID of the room this exit resides in.
  @ReferenceName('exits')
  IntColumn get locationId =>
      integer().references(Rooms, #id, onDelete: KeyAction.cascade)();

  /// The ID of the room this exit leads to.
  @ReferenceName('entrances')
  IntColumn get destinationId => integer()
      .references(Rooms, #id, onDelete: KeyAction.cascade)
      .nullable()();
}
