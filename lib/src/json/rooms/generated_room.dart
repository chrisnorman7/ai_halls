import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import 'generated_room_exit.dart';
import 'generated_room_object.dart';

part 'generated_room.g.dart';

/// A class representing a Room with its various properties.
@JsonSerializable()
class GeneratedRoom {
  /// Constructor for the Room class.
  const GeneratedRoom({
    required this.name,
    required this.description,
    required this.ambiance,
    required this.width,
    required this.length,
    required this.objects,
    required this.exits,
  });

  /// Load an instance from [json].
  factory GeneratedRoom.fromJson(final JsonMap json) =>
      _$GeneratedRoomFromJson(json);

  /// Name of the room.
  final String name;

  /// Description of the room.
  final String description;

  /// Ambiance of the room.
  final String ambiance;

  /// Width of the room.
  final int width;

  /// Length of the room.
  final int length;

  /// List of objects in the room.
  final List<GeneratedRoomObject> objects;

  /// List of exits in the room.
  final List<GeneratedRoomExit> exits;

  /// Convert to JSON.
  JsonMap toJson() => _$GeneratedRoomToJson(this);
}
