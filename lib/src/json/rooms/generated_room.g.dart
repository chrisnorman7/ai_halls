// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratedRoom _$GeneratedRoomFromJson(Map<String, dynamic> json) =>
    GeneratedRoom(
      name: json['name'] as String,
      description: json['description'] as String,
      ambiance: json['ambiance'] as String,
      width: (json['width'] as num).toInt(),
      length: (json['length'] as num).toInt(),
      objects: (json['objects'] as List<dynamic>)
          .map((e) => GeneratedRoomObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      exits: (json['exits'] as List<dynamic>)
          .map((e) => GeneratedRoomExit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GeneratedRoomToJson(GeneratedRoom instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'ambiance': instance.ambiance,
      'width': instance.width,
      'length': instance.length,
      'objects': instance.objects,
      'exits': instance.exits,
    };
