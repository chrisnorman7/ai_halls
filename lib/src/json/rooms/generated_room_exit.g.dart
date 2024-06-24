// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_room_exit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratedRoomExit _$GeneratedRoomExitFromJson(Map<String, dynamic> json) =>
    GeneratedRoomExit(
      name: json['name'] as String,
      description: json['description'] as String,
      x: (json['x'] as num).toInt(),
      y: (json['y'] as num).toInt(),
    );

Map<String, dynamic> _$GeneratedRoomExitToJson(GeneratedRoomExit instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'x': instance.x,
      'y': instance.y,
    };
