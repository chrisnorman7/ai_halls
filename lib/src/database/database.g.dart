// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $WorldsTable extends Worlds with TableInfo<$WorldsTable, World> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorldsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'worlds';
  @override
  VerificationContext validateIntegrity(Insertable<World> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  World map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return World(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $WorldsTable createAlias(String alias) {
    return $WorldsTable(attachedDatabase, alias);
  }
}

class World extends DataClass implements Insertable<World> {
  /// The id column.
  final int id;

  /// The name column.
  final String name;

  /// The description column.
  final String description;
  const World(
      {required this.id, required this.name, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    return map;
  }

  WorldsCompanion toCompanion(bool nullToAbsent) {
    return WorldsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
    );
  }

  factory World.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return World(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  World copyWith({int? id, String? name, String? description}) => World(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('World(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is World &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class WorldsCompanion extends UpdateCompanion<World> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  const WorldsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  WorldsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
  })  : name = Value(name),
        description = Value(description);
  static Insertable<World> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  WorldsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? description}) {
    return WorldsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorldsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $RoomsTable extends Rooms with TableInfo<$RoomsTable, Room> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _worldIdMeta =
      const VerificationMeta('worldId');
  @override
  late final GeneratedColumn<int> worldId = GeneratedColumn<int>(
      'world_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES worlds (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [id, name, worldId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rooms';
  @override
  VerificationContext validateIntegrity(Insertable<Room> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('world_id')) {
      context.handle(_worldIdMeta,
          worldId.isAcceptableOrUnknown(data['world_id']!, _worldIdMeta));
    } else if (isInserting) {
      context.missing(_worldIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Room map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Room(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      worldId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}world_id'])!,
    );
  }

  @override
  $RoomsTable createAlias(String alias) {
    return $RoomsTable(attachedDatabase, alias);
  }
}

class Room extends DataClass implements Insertable<Room> {
  /// The id column.
  final int id;

  /// The name column.
  final String name;

  /// The ID of the world which rooms belong to.
  final int worldId;
  const Room({required this.id, required this.name, required this.worldId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['world_id'] = Variable<int>(worldId);
    return map;
  }

  RoomsCompanion toCompanion(bool nullToAbsent) {
    return RoomsCompanion(
      id: Value(id),
      name: Value(name),
      worldId: Value(worldId),
    );
  }

  factory Room.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Room(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      worldId: serializer.fromJson<int>(json['worldId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'worldId': serializer.toJson<int>(worldId),
    };
  }

  Room copyWith({int? id, String? name, int? worldId}) => Room(
        id: id ?? this.id,
        name: name ?? this.name,
        worldId: worldId ?? this.worldId,
      );
  @override
  String toString() {
    return (StringBuffer('Room(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('worldId: $worldId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, worldId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Room &&
          other.id == this.id &&
          other.name == this.name &&
          other.worldId == this.worldId);
}

class RoomsCompanion extends UpdateCompanion<Room> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> worldId;
  const RoomsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.worldId = const Value.absent(),
  });
  RoomsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int worldId,
  })  : name = Value(name),
        worldId = Value(worldId);
  static Insertable<Room> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? worldId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (worldId != null) 'world_id': worldId,
    });
  }

  RoomsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? worldId}) {
    return RoomsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      worldId: worldId ?? this.worldId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (worldId.present) {
      map['world_id'] = Variable<int>(worldId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('worldId: $worldId')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  _$DatabaseManager get managers => _$DatabaseManager(this);
  late final $WorldsTable worlds = $WorldsTable(this);
  late final $RoomsTable rooms = $RoomsTable(this);
  late final WorldsDao worldsDao = WorldsDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [worlds, rooms];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('worlds',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('rooms', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$WorldsTableInsertCompanionBuilder = WorldsCompanion Function({
  Value<int> id,
  required String name,
  required String description,
});
typedef $$WorldsTableUpdateCompanionBuilder = WorldsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
});

class $$WorldsTableTableManager extends RootTableManager<
    _$Database,
    $WorldsTable,
    World,
    $$WorldsTableFilterComposer,
    $$WorldsTableOrderingComposer,
    $$WorldsTableProcessedTableManager,
    $$WorldsTableInsertCompanionBuilder,
    $$WorldsTableUpdateCompanionBuilder> {
  $$WorldsTableTableManager(_$Database db, $WorldsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WorldsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WorldsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$WorldsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
          }) =>
              WorldsCompanion(
            id: id,
            name: name,
            description: description,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
          }) =>
              WorldsCompanion.insert(
            id: id,
            name: name,
            description: description,
          ),
        ));
}

class $$WorldsTableProcessedTableManager extends ProcessedTableManager<
    _$Database,
    $WorldsTable,
    World,
    $$WorldsTableFilterComposer,
    $$WorldsTableOrderingComposer,
    $$WorldsTableProcessedTableManager,
    $$WorldsTableInsertCompanionBuilder,
    $$WorldsTableUpdateCompanionBuilder> {
  $$WorldsTableProcessedTableManager(super.$state);
}

class $$WorldsTableFilterComposer
    extends FilterComposer<_$Database, $WorldsTable> {
  $$WorldsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter roomsRefs(
      ComposableFilter Function($$RoomsTableFilterComposer f) f) {
    final $$RoomsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.rooms,
        getReferencedColumn: (t) => t.worldId,
        builder: (joinBuilder, parentComposers) => $$RoomsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.rooms, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$WorldsTableOrderingComposer
    extends OrderingComposer<_$Database, $WorldsTable> {
  $$WorldsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$RoomsTableInsertCompanionBuilder = RoomsCompanion Function({
  Value<int> id,
  required String name,
  required int worldId,
});
typedef $$RoomsTableUpdateCompanionBuilder = RoomsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> worldId,
});

class $$RoomsTableTableManager extends RootTableManager<
    _$Database,
    $RoomsTable,
    Room,
    $$RoomsTableFilterComposer,
    $$RoomsTableOrderingComposer,
    $$RoomsTableProcessedTableManager,
    $$RoomsTableInsertCompanionBuilder,
    $$RoomsTableUpdateCompanionBuilder> {
  $$RoomsTableTableManager(_$Database db, $RoomsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RoomsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RoomsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$RoomsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> worldId = const Value.absent(),
          }) =>
              RoomsCompanion(
            id: id,
            name: name,
            worldId: worldId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int worldId,
          }) =>
              RoomsCompanion.insert(
            id: id,
            name: name,
            worldId: worldId,
          ),
        ));
}

class $$RoomsTableProcessedTableManager extends ProcessedTableManager<
    _$Database,
    $RoomsTable,
    Room,
    $$RoomsTableFilterComposer,
    $$RoomsTableOrderingComposer,
    $$RoomsTableProcessedTableManager,
    $$RoomsTableInsertCompanionBuilder,
    $$RoomsTableUpdateCompanionBuilder> {
  $$RoomsTableProcessedTableManager(super.$state);
}

class $$RoomsTableFilterComposer
    extends FilterComposer<_$Database, $RoomsTable> {
  $$RoomsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$WorldsTableFilterComposer get worldId {
    final $$WorldsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.worldId,
        referencedTable: $state.db.worlds,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WorldsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.worlds, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$RoomsTableOrderingComposer
    extends OrderingComposer<_$Database, $RoomsTable> {
  $$RoomsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$WorldsTableOrderingComposer get worldId {
    final $$WorldsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.worldId,
        referencedTable: $state.db.worlds,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$WorldsTableOrderingComposer(ComposerState(
                $state.db, $state.db.worlds, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$DatabaseManager {
  final _$Database _db;
  _$DatabaseManager(this._db);
  $$WorldsTableTableManager get worlds =>
      $$WorldsTableTableManager(_db, _db.worlds);
  $$RoomsTableTableManager get rooms =>
      $$RoomsTableTableManager(_db, _db.rooms);
}
