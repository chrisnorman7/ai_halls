import 'package:drift/drift.dart';

import 'mixins.dart';
import 'worlds.dart';

/// The rooms table.
class Rooms extends Table with IdMixin, NameMixin {
  /// The ID of the world which rooms belong to.
  IntColumn get worldId =>
      integer().references(Worlds, #id, onDelete: KeyAction.cascade)();
}
