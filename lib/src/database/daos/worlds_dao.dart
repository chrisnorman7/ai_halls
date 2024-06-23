import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/worlds.dart';

part 'worlds_dao.g.dart';

/// The worlds DAO.
@DriftAccessor(tables: [Worlds])
class WorldsDao extends DatabaseAccessor<Database> with _$WorldsDaoMixin {
  /// Create an instance.
  WorldsDao(super.db);

  /// Create a new row.
  Future<World> createWorld({
    required final String name,
    required final String description,
  }) =>
      db.managers.worlds.createReturning(
        (final o) => o(
          name: name,
          description: description,
        ),
      );

  /// Update [world].
  Future<World> editWorld({
    required final World world,
    final String? name,
    final String? description,
  }) async {
    final copy = world.copyWith(
      name: name ?? world.name,
      description: description ?? world.description,
    );
    await db.managers.worlds.replace(copy);
    return copy;
  }

  /// Delete [world].
  Future<int> deleteWorld(final World world) =>
      db.managers.worlds.filter((final o) => o.id(world.id)).delete();

  /// Get a single row by [id].
  Future<World> getWorld(final int id) =>
      db.managers.worlds.filter((final o) => o.id(id)).getSingle();

  /// Get all worlds, sorted by name.
  Future<List<World>> getWorlds() async => db.managers.worlds
      .orderBy(
        (final o) => o.name.asc(),
      )
      .get();
}
