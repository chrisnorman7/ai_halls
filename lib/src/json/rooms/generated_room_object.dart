import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';

part 'generated_room_object.g.dart';

/// A class representing an object in the room.
@JsonSerializable()
class GeneratedRoomObject {
  /// Constructor for the RoomObject class.
  const GeneratedRoomObject({
    required this.name,
    required this.description,
    required this.x,
    required this.y,
  });

  /// Create an instance from [json].
  factory GeneratedRoomObject.fromJson(final JsonMap json) =>
      _$GeneratedRoomObjectFromJson(json);

  /// Name of the object.
  final String name;

  /// Description of the object.
  final String description;

  /// X-coordinate of the object in the room.
  final int x;

  /// Y-coordinate of the object in the room.
  final int y;

  /// Convert to JSON.
  JsonMap toJson() => _$GeneratedRoomObjectToJson(this);
}
