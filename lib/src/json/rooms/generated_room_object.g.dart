// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_room_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratedRoomObject _$GeneratedRoomObjectFromJson(Map<String, dynamic> json) =>
    GeneratedRoomObject(
      name: json['name'] as String,
      description: json['description'] as String,
      x: (json['x'] as num).toInt(),
      y: (json['y'] as num).toInt(),
    );

Map<String, dynamic> _$GeneratedRoomObjectToJson(
        GeneratedRoomObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'x': instance.x,
      'y': instance.y,
    };
