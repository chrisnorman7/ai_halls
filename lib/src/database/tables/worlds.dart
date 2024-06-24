import 'package:drift/drift.dart';

import 'mixins.dart';
import 'rooms.dart';

/// THe worlds table.
class Worlds extends Table with IdMixin, NameMixin, DescriptionMixin {
  /// The ID of the first room.
  IntColumn get firstRoomId => integer()
      .references(Rooms, #id, onDelete: KeyAction.setDefault)
      .nullable()();
}
