import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';

part 'generated_room_exit.g.dart';

/// A class representing an exit in the room.
@JsonSerializable()
class GeneratedRoomExit {
  /// Constructor for the RoomExit class.
  const GeneratedRoomExit({
    required this.name,
    required this.description,
    required this.x,
    required this.y,
  });

  /// Factory method to create a RoomExit instance from a JSON map.
  factory GeneratedRoomExit.fromJson(final JsonMap json) =>
      _$GeneratedRoomExitFromJson(json);

  /// Name of the exit.
  final String name;

  /// Description of the exit.
  final String description;

  /// X-coordinate of the exit in the room.
  final int x;

  /// Y-coordinate of the exit in the room.
  final int y;

  /// Method to convert a RoomExit instance to a JSON map.
  JsonMap toJson() => _$GeneratedRoomExitToJson(this);
}
