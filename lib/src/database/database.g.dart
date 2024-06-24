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
  static const VerificationMeta _firstRoomIdMeta =
      const VerificationMeta('firstRoomId');
  @override
  late final GeneratedColumn<int> firstRoomId = GeneratedColumn<int>(
      'first_room_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, description, firstRoomId];
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
    if (data.containsKey('first_room_id')) {
      context.handle(
          _firstRoomIdMeta,
          firstRoomId.isAcceptableOrUnknown(
              data['first_room_id']!, _firstRoomIdMeta));
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
      firstRoomId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}first_room_id']),
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

  /// The ID of the first room.
  final int? firstRoomId;
  const World(
      {required this.id,
      required this.name,
      required this.description,
      this.firstRoomId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || firstRoomId != null) {
      map['first_room_id'] = Variable<int>(firstRoomId);
    }
    return map;
  }

  WorldsCompanion toCompanion(bool nullToAbsent) {
    return WorldsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      firstRoomId: firstRoomId == null && nullToAbsent
          ? const Value.absent()
          : Value(firstRoomId),
    );
  }

  factory World.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return World(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      firstRoomId: serializer.fromJson<int?>(json['firstRoomId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'firstRoomId': serializer.toJson<int?>(firstRoomId),
    };
  }

  World copyWith(
          {int? id,
          String? name,
          String? description,
          Value<int?> firstRoomId = const Value.absent()}) =>
      World(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        firstRoomId: firstRoomId.present ? firstRoomId.value : this.firstRoomId,
      );
  @override
  String toString() {
    return (StringBuffer('World(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('firstRoomId: $firstRoomId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, firstRoomId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is World &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.firstRoomId == this.firstRoomId);
}

class WorldsCompanion extends UpdateCompanion<World> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int?> firstRoomId;
  const WorldsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.firstRoomId = const Value.absent(),
  });
  WorldsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.firstRoomId = const Value.absent(),
  })  : name = Value(name),
        description = Value(description);
  static Insertable<World> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? firstRoomId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (firstRoomId != null) 'first_room_id': firstRoomId,
    });
  }

  WorldsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int?>? firstRoomId}) {
    return WorldsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      firstRoomId: firstRoomId ?? this.firstRoomId,
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
    if (firstRoomId.present) {
      map['first_room_id'] = Variable<int>(firstRoomId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorldsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('firstRoomId: $firstRoomId')
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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
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
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
      'width', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lengthMeta = const VerificationMeta('length');
  @override
  late final GeneratedColumn<int> length = GeneratedColumn<int>(
      'length', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, worldId, width, length];
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('world_id')) {
      context.handle(_worldIdMeta,
          worldId.isAcceptableOrUnknown(data['world_id']!, _worldIdMeta));
    } else if (isInserting) {
      context.missing(_worldIdMeta);
    }
    if (data.containsKey('width')) {
      context.handle(
          _widthMeta, width.isAcceptableOrUnknown(data['width']!, _widthMeta));
    } else if (isInserting) {
      context.missing(_widthMeta);
    }
    if (data.containsKey('length')) {
      context.handle(_lengthMeta,
          length.isAcceptableOrUnknown(data['length']!, _lengthMeta));
    } else if (isInserting) {
      context.missing(_lengthMeta);
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
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      worldId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}world_id'])!,
      width: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}width'])!,
      length: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}length'])!,
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

  /// The description column.
  final String description;

  /// The ID of the world which rooms belong to.
  final int worldId;

  /// The maximum x coordinate.
  final int width;

  /// The maximum y coordinate.
  final int length;
  const Room(
      {required this.id,
      required this.name,
      required this.description,
      required this.worldId,
      required this.width,
      required this.length});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['world_id'] = Variable<int>(worldId);
    map['width'] = Variable<int>(width);
    map['length'] = Variable<int>(length);
    return map;
  }

  RoomsCompanion toCompanion(bool nullToAbsent) {
    return RoomsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      worldId: Value(worldId),
      width: Value(width),
      length: Value(length),
    );
  }

  factory Room.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Room(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      worldId: serializer.fromJson<int>(json['worldId']),
      width: serializer.fromJson<int>(json['width']),
      length: serializer.fromJson<int>(json['length']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'worldId': serializer.toJson<int>(worldId),
      'width': serializer.toJson<int>(width),
      'length': serializer.toJson<int>(length),
    };
  }

  Room copyWith(
          {int? id,
          String? name,
          String? description,
          int? worldId,
          int? width,
          int? length}) =>
      Room(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        worldId: worldId ?? this.worldId,
        width: width ?? this.width,
        length: length ?? this.length,
      );
  @override
  String toString() {
    return (StringBuffer('Room(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('worldId: $worldId, ')
          ..write('width: $width, ')
          ..write('length: $length')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, worldId, width, length);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Room &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.worldId == this.worldId &&
          other.width == this.width &&
          other.length == this.length);
}

class RoomsCompanion extends UpdateCompanion<Room> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> worldId;
  final Value<int> width;
  final Value<int> length;
  const RoomsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.worldId = const Value.absent(),
    this.width = const Value.absent(),
    this.length = const Value.absent(),
  });
  RoomsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required int worldId,
    required int width,
    required int length,
  })  : name = Value(name),
        description = Value(description),
        worldId = Value(worldId),
        width = Value(width),
        length = Value(length);
  static Insertable<Room> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? worldId,
    Expression<int>? width,
    Expression<int>? length,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (worldId != null) 'world_id': worldId,
      if (width != null) 'width': width,
      if (length != null) 'length': length,
    });
  }

  RoomsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int>? worldId,
      Value<int>? width,
      Value<int>? length}) {
    return RoomsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      worldId: worldId ?? this.worldId,
      width: width ?? this.width,
      length: length ?? this.length,
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
    if (worldId.present) {
      map['world_id'] = Variable<int>(worldId.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (length.present) {
      map['length'] = Variable<int>(length.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('worldId: $worldId, ')
          ..write('width: $width, ')
          ..write('length: $length')
          ..write(')'))
        .toString();
  }
}

class $RoomObjectsTable extends RoomObjects
    with TableInfo<$RoomObjectsTable, RoomObject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomObjectsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedColumn<int> x = GeneratedColumn<int>(
      'x', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedColumn<int> y = GeneratedColumn<int>(
      'y', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _locationIdMeta =
      const VerificationMeta('locationId');
  @override
  late final GeneratedColumn<int> locationId = GeneratedColumn<int>(
      'location_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES rooms (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, x, y, locationId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_objects';
  @override
  VerificationContext validateIntegrity(Insertable<RoomObject> instance,
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
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    if (data.containsKey('location_id')) {
      context.handle(
          _locationIdMeta,
          locationId.isAcceptableOrUnknown(
              data['location_id']!, _locationIdMeta));
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomObject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomObject(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      x: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}x'])!,
      y: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}y'])!,
      locationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location_id'])!,
    );
  }

  @override
  $RoomObjectsTable createAlias(String alias) {
    return $RoomObjectsTable(attachedDatabase, alias);
  }
}

class RoomObject extends DataClass implements Insertable<RoomObject> {
  /// The id column.
  final int id;

  /// The name column.
  final String name;

  /// The description column.
  final String description;

  /// The x coordinate.
  final int x;

  /// The y coordinate.
  final int y;

  /// The ID of the room this object is connected to.
  final int locationId;
  const RoomObject(
      {required this.id,
      required this.name,
      required this.description,
      required this.x,
      required this.y,
      required this.locationId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['x'] = Variable<int>(x);
    map['y'] = Variable<int>(y);
    map['location_id'] = Variable<int>(locationId);
    return map;
  }

  RoomObjectsCompanion toCompanion(bool nullToAbsent) {
    return RoomObjectsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      x: Value(x),
      y: Value(y),
      locationId: Value(locationId),
    );
  }

  factory RoomObject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomObject(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      x: serializer.fromJson<int>(json['x']),
      y: serializer.fromJson<int>(json['y']),
      locationId: serializer.fromJson<int>(json['locationId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'x': serializer.toJson<int>(x),
      'y': serializer.toJson<int>(y),
      'locationId': serializer.toJson<int>(locationId),
    };
  }

  RoomObject copyWith(
          {int? id,
          String? name,
          String? description,
          int? x,
          int? y,
          int? locationId}) =>
      RoomObject(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        x: x ?? this.x,
        y: y ?? this.y,
        locationId: locationId ?? this.locationId,
      );
  @override
  String toString() {
    return (StringBuffer('RoomObject(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('locationId: $locationId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, x, y, locationId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomObject &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.x == this.x &&
          other.y == this.y &&
          other.locationId == this.locationId);
}

class RoomObjectsCompanion extends UpdateCompanion<RoomObject> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> x;
  final Value<int> y;
  final Value<int> locationId;
  const RoomObjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.locationId = const Value.absent(),
  });
  RoomObjectsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required int x,
    required int y,
    required int locationId,
  })  : name = Value(name),
        description = Value(description),
        x = Value(x),
        y = Value(y),
        locationId = Value(locationId);
  static Insertable<RoomObject> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? x,
    Expression<int>? y,
    Expression<int>? locationId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (locationId != null) 'location_id': locationId,
    });
  }

  RoomObjectsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int>? x,
      Value<int>? y,
      Value<int>? locationId}) {
    return RoomObjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      x: x ?? this.x,
      y: y ?? this.y,
      locationId: locationId ?? this.locationId,
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
    if (x.present) {
      map['x'] = Variable<int>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<int>(y.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<int>(locationId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomObjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('locationId: $locationId')
          ..write(')'))
        .toString();
  }
}

class $RoomExitsTable extends RoomExits
    with TableInfo<$RoomExitsTable, RoomExit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomExitsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedColumn<int> x = GeneratedColumn<int>(
      'x', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedColumn<int> y = GeneratedColumn<int>(
      'y', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _locationIdMeta =
      const VerificationMeta('locationId');
  @override
  late final GeneratedColumn<int> locationId = GeneratedColumn<int>(
      'location_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES rooms (id) ON DELETE CASCADE'));
  static const VerificationMeta _destinationIdMeta =
      const VerificationMeta('destinationId');
  @override
  late final GeneratedColumn<int> destinationId = GeneratedColumn<int>(
      'destination_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES rooms (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, x, y, locationId, destinationId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_exits';
  @override
  VerificationContext validateIntegrity(Insertable<RoomExit> instance,
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
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    if (data.containsKey('location_id')) {
      context.handle(
          _locationIdMeta,
          locationId.isAcceptableOrUnknown(
              data['location_id']!, _locationIdMeta));
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    if (data.containsKey('destination_id')) {
      context.handle(
          _destinationIdMeta,
          destinationId.isAcceptableOrUnknown(
              data['destination_id']!, _destinationIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomExit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomExit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      x: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}x'])!,
      y: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}y'])!,
      locationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location_id'])!,
      destinationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}destination_id']),
    );
  }

  @override
  $RoomExitsTable createAlias(String alias) {
    return $RoomExitsTable(attachedDatabase, alias);
  }
}

class RoomExit extends DataClass implements Insertable<RoomExit> {
  /// The id column.
  final int id;

  /// The name column.
  final String name;

  /// The description column.
  final String description;

  /// The x coordinate.
  final int x;

  /// The y coordinate.
  final int y;

  /// The ID of the room this exit resides in.
  final int locationId;

  /// The ID of the room this exit leads to.
  final int? destinationId;
  const RoomExit(
      {required this.id,
      required this.name,
      required this.description,
      required this.x,
      required this.y,
      required this.locationId,
      this.destinationId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['x'] = Variable<int>(x);
    map['y'] = Variable<int>(y);
    map['location_id'] = Variable<int>(locationId);
    if (!nullToAbsent || destinationId != null) {
      map['destination_id'] = Variable<int>(destinationId);
    }
    return map;
  }

  RoomExitsCompanion toCompanion(bool nullToAbsent) {
    return RoomExitsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      x: Value(x),
      y: Value(y),
      locationId: Value(locationId),
      destinationId: destinationId == null && nullToAbsent
          ? const Value.absent()
          : Value(destinationId),
    );
  }

  factory RoomExit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomExit(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      x: serializer.fromJson<int>(json['x']),
      y: serializer.fromJson<int>(json['y']),
      locationId: serializer.fromJson<int>(json['locationId']),
      destinationId: serializer.fromJson<int?>(json['destinationId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'x': serializer.toJson<int>(x),
      'y': serializer.toJson<int>(y),
      'locationId': serializer.toJson<int>(locationId),
      'destinationId': serializer.toJson<int?>(destinationId),
    };
  }

  RoomExit copyWith(
          {int? id,
          String? name,
          String? description,
          int? x,
          int? y,
          int? locationId,
          Value<int?> destinationId = const Value.absent()}) =>
      RoomExit(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        x: x ?? this.x,
        y: y ?? this.y,
        locationId: locationId ?? this.locationId,
        destinationId:
            destinationId.present ? destinationId.value : this.destinationId,
      );
  @override
  String toString() {
    return (StringBuffer('RoomExit(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('locationId: $locationId, ')
          ..write('destinationId: $destinationId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, x, y, locationId, destinationId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomExit &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.x == this.x &&
          other.y == this.y &&
          other.locationId == this.locationId &&
          other.destinationId == this.destinationId);
}

class RoomExitsCompanion extends UpdateCompanion<RoomExit> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> x;
  final Value<int> y;
  final Value<int> locationId;
  final Value<int?> destinationId;
  const RoomExitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.locationId = const Value.absent(),
    this.destinationId = const Value.absent(),
  });
  RoomExitsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required int x,
    required int y,
    required int locationId,
    this.destinationId = const Value.absent(),
  })  : name = Value(name),
        description = Value(description),
        x = Value(x),
        y = Value(y),
        locationId = Value(locationId);
  static Insertable<RoomExit> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? x,
    Expression<int>? y,
    Expression<int>? locationId,
    Expression<int>? destinationId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (locationId != null) 'location_id': locationId,
      if (destinationId != null) 'destination_id': destinationId,
    });
  }

  RoomExitsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int>? x,
      Value<int>? y,
      Value<int>? locationId,
      Value<int?>? destinationId}) {
    return RoomExitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      x: x ?? this.x,
      y: y ?? this.y,
      locationId: locationId ?? this.locationId,
      destinationId: destinationId ?? this.destinationId,
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
    if (x.present) {
      map['x'] = Variable<int>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<int>(y.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<int>(locationId.value);
    }
    if (destinationId.present) {
      map['destination_id'] = Variable<int>(destinationId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomExitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('locationId: $locationId, ')
          ..write('destinationId: $destinationId')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  _$DatabaseManager get managers => _$DatabaseManager(this);
  late final $WorldsTable worlds = $WorldsTable(this);
  late final $RoomsTable rooms = $RoomsTable(this);
  late final $RoomObjectsTable roomObjects = $RoomObjectsTable(this);
  late final $RoomExitsTable roomExits = $RoomExitsTable(this);
  late final WorldsDao worldsDao = WorldsDao(this as Database);
  late final RoomsDao roomsDao = RoomsDao(this as Database);
  late final RoomObjectsDao roomObjectsDao = RoomObjectsDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [worlds, rooms, roomObjects, roomExits];
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
          WritePropagation(
            on: TableUpdateQuery.onTableName('rooms',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_objects', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('rooms',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_exits', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('rooms',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_exits', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$WorldsTableInsertCompanionBuilder = WorldsCompanion Function({
  Value<int> id,
  required String name,
  required String description,
  Value<int?> firstRoomId,
});
typedef $$WorldsTableUpdateCompanionBuilder = WorldsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<int?> firstRoomId,
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
            Value<int?> firstRoomId = const Value.absent(),
          }) =>
              WorldsCompanion(
            id: id,
            name: name,
            description: description,
            firstRoomId: firstRoomId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            Value<int?> firstRoomId = const Value.absent(),
          }) =>
              WorldsCompanion.insert(
            id: id,
            name: name,
            description: description,
            firstRoomId: firstRoomId,
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

  ColumnFilters<int> get firstRoomId => $state.composableBuilder(
      column: $state.table.firstRoomId,
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

  ColumnOrderings<int> get firstRoomId => $state.composableBuilder(
      column: $state.table.firstRoomId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$RoomsTableInsertCompanionBuilder = RoomsCompanion Function({
  Value<int> id,
  required String name,
  required String description,
  required int worldId,
  required int width,
  required int length,
});
typedef $$RoomsTableUpdateCompanionBuilder = RoomsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<int> worldId,
  Value<int> width,
  Value<int> length,
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
            Value<String> description = const Value.absent(),
            Value<int> worldId = const Value.absent(),
            Value<int> width = const Value.absent(),
            Value<int> length = const Value.absent(),
          }) =>
              RoomsCompanion(
            id: id,
            name: name,
            description: description,
            worldId: worldId,
            width: width,
            length: length,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            required int worldId,
            required int width,
            required int length,
          }) =>
              RoomsCompanion.insert(
            id: id,
            name: name,
            description: description,
            worldId: worldId,
            width: width,
            length: length,
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

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get width => $state.composableBuilder(
      column: $state.table.width,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get length => $state.composableBuilder(
      column: $state.table.length,
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

  ComposableFilter roomObjectsRefs(
      ComposableFilter Function($$RoomObjectsTableFilterComposer f) f) {
    final $$RoomObjectsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.roomObjects,
        getReferencedColumn: (t) => t.locationId,
        builder: (joinBuilder, parentComposers) =>
            $$RoomObjectsTableFilterComposer(ComposerState($state.db,
                $state.db.roomObjects, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter exits(
      ComposableFilter Function($$RoomExitsTableFilterComposer f) f) {
    final $$RoomExitsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.roomExits,
        getReferencedColumn: (t) => t.locationId,
        builder: (joinBuilder, parentComposers) =>
            $$RoomExitsTableFilterComposer(ComposerState(
                $state.db, $state.db.roomExits, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter entrances(
      ComposableFilter Function($$RoomExitsTableFilterComposer f) f) {
    final $$RoomExitsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.roomExits,
        getReferencedColumn: (t) => t.destinationId,
        builder: (joinBuilder, parentComposers) =>
            $$RoomExitsTableFilterComposer(ComposerState(
                $state.db, $state.db.roomExits, joinBuilder, parentComposers)));
    return f(composer);
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

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get width => $state.composableBuilder(
      column: $state.table.width,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get length => $state.composableBuilder(
      column: $state.table.length,
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

typedef $$RoomObjectsTableInsertCompanionBuilder = RoomObjectsCompanion
    Function({
  Value<int> id,
  required String name,
  required String description,
  required int x,
  required int y,
  required int locationId,
});
typedef $$RoomObjectsTableUpdateCompanionBuilder = RoomObjectsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<int> x,
  Value<int> y,
  Value<int> locationId,
});

class $$RoomObjectsTableTableManager extends RootTableManager<
    _$Database,
    $RoomObjectsTable,
    RoomObject,
    $$RoomObjectsTableFilterComposer,
    $$RoomObjectsTableOrderingComposer,
    $$RoomObjectsTableProcessedTableManager,
    $$RoomObjectsTableInsertCompanionBuilder,
    $$RoomObjectsTableUpdateCompanionBuilder> {
  $$RoomObjectsTableTableManager(_$Database db, $RoomObjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RoomObjectsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RoomObjectsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$RoomObjectsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> x = const Value.absent(),
            Value<int> y = const Value.absent(),
            Value<int> locationId = const Value.absent(),
          }) =>
              RoomObjectsCompanion(
            id: id,
            name: name,
            description: description,
            x: x,
            y: y,
            locationId: locationId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            required int x,
            required int y,
            required int locationId,
          }) =>
              RoomObjectsCompanion.insert(
            id: id,
            name: name,
            description: description,
            x: x,
            y: y,
            locationId: locationId,
          ),
        ));
}

class $$RoomObjectsTableProcessedTableManager extends ProcessedTableManager<
    _$Database,
    $RoomObjectsTable,
    RoomObject,
    $$RoomObjectsTableFilterComposer,
    $$RoomObjectsTableOrderingComposer,
    $$RoomObjectsTableProcessedTableManager,
    $$RoomObjectsTableInsertCompanionBuilder,
    $$RoomObjectsTableUpdateCompanionBuilder> {
  $$RoomObjectsTableProcessedTableManager(super.$state);
}

class $$RoomObjectsTableFilterComposer
    extends FilterComposer<_$Database, $RoomObjectsTable> {
  $$RoomObjectsTableFilterComposer(super.$state);
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

  ColumnFilters<int> get x => $state.composableBuilder(
      column: $state.table.x,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get y => $state.composableBuilder(
      column: $state.table.y,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$RoomsTableFilterComposer get locationId {
    final $$RoomsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.locationId,
        referencedTable: $state.db.rooms,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$RoomsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.rooms, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$RoomObjectsTableOrderingComposer
    extends OrderingComposer<_$Database, $RoomObjectsTable> {
  $$RoomObjectsTableOrderingComposer(super.$state);
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

  ColumnOrderings<int> get x => $state.composableBuilder(
      column: $state.table.x,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get y => $state.composableBuilder(
      column: $state.table.y,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$RoomsTableOrderingComposer get locationId {
    final $$RoomsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.locationId,
        referencedTable: $state.db.rooms,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$RoomsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.rooms, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$RoomExitsTableInsertCompanionBuilder = RoomExitsCompanion Function({
  Value<int> id,
  required String name,
  required String description,
  required int x,
  required int y,
  required int locationId,
  Value<int?> destinationId,
});
typedef $$RoomExitsTableUpdateCompanionBuilder = RoomExitsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<int> x,
  Value<int> y,
  Value<int> locationId,
  Value<int?> destinationId,
});

class $$RoomExitsTableTableManager extends RootTableManager<
    _$Database,
    $RoomExitsTable,
    RoomExit,
    $$RoomExitsTableFilterComposer,
    $$RoomExitsTableOrderingComposer,
    $$RoomExitsTableProcessedTableManager,
    $$RoomExitsTableInsertCompanionBuilder,
    $$RoomExitsTableUpdateCompanionBuilder> {
  $$RoomExitsTableTableManager(_$Database db, $RoomExitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RoomExitsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RoomExitsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$RoomExitsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> x = const Value.absent(),
            Value<int> y = const Value.absent(),
            Value<int> locationId = const Value.absent(),
            Value<int?> destinationId = const Value.absent(),
          }) =>
              RoomExitsCompanion(
            id: id,
            name: name,
            description: description,
            x: x,
            y: y,
            locationId: locationId,
            destinationId: destinationId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            required int x,
            required int y,
            required int locationId,
            Value<int?> destinationId = const Value.absent(),
          }) =>
              RoomExitsCompanion.insert(
            id: id,
            name: name,
            description: description,
            x: x,
            y: y,
            locationId: locationId,
            destinationId: destinationId,
          ),
        ));
}

class $$RoomExitsTableProcessedTableManager extends ProcessedTableManager<
    _$Database,
    $RoomExitsTable,
    RoomExit,
    $$RoomExitsTableFilterComposer,
    $$RoomExitsTableOrderingComposer,
    $$RoomExitsTableProcessedTableManager,
    $$RoomExitsTableInsertCompanionBuilder,
    $$RoomExitsTableUpdateCompanionBuilder> {
  $$RoomExitsTableProcessedTableManager(super.$state);
}

class $$RoomExitsTableFilterComposer
    extends FilterComposer<_$Database, $RoomExitsTable> {
  $$RoomExitsTableFilterComposer(super.$state);
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

  ColumnFilters<int> get x => $state.composableBuilder(
      column: $state.table.x,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get y => $state.composableBuilder(
      column: $state.table.y,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$RoomsTableFilterComposer get locationId {
    final $$RoomsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.locationId,
        referencedTable: $state.db.rooms,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$RoomsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.rooms, joinBuilder, parentComposers)));
    return composer;
  }

  $$RoomsTableFilterComposer get destinationId {
    final $$RoomsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.destinationId,
        referencedTable: $state.db.rooms,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$RoomsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.rooms, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$RoomExitsTableOrderingComposer
    extends OrderingComposer<_$Database, $RoomExitsTable> {
  $$RoomExitsTableOrderingComposer(super.$state);
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

  ColumnOrderings<int> get x => $state.composableBuilder(
      column: $state.table.x,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get y => $state.composableBuilder(
      column: $state.table.y,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$RoomsTableOrderingComposer get locationId {
    final $$RoomsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.locationId,
        referencedTable: $state.db.rooms,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$RoomsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.rooms, joinBuilder, parentComposers)));
    return composer;
  }

  $$RoomsTableOrderingComposer get destinationId {
    final $$RoomsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.destinationId,
        referencedTable: $state.db.rooms,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$RoomsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.rooms, joinBuilder, parentComposers)));
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
  $$RoomObjectsTableTableManager get roomObjects =>
      $$RoomObjectsTableTableManager(_db, _db.roomObjects);
  $$RoomExitsTableTableManager get roomExits =>
      $$RoomExitsTableTableManager(_db, _db.roomExits);
}
