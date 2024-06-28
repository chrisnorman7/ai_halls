import 'package:drift/drift.dart';

import 'mixins.dart';
import 'worlds.dart';

/// The rooms table.
class Rooms extends Table with IdMixin, NameMixin, DescriptionMixin {
  /// The ID of the world which rooms belong to.
  @ReferenceName('world')
  IntColumn get worldId =>
      integer().references(Worlds, #id, onDelete: KeyAction.cascade)();

  /// The maximum x coordinate.
  IntColumn get width => integer()();

  /// The maximum y coordinate.
  IntColumn get length => integer()();

  /// The time this room was created at.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// The prompt which generated this room.
  TextColumn get prompt => text()();

  /// The JSON response from GPT.
  TextColumn get jsonSchema => text()();
}
