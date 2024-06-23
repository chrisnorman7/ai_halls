// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameOptions _$GameOptionsFromJson(Map<String, dynamic> json) => GameOptions(
      apiKey: json['apiKey'] as String?,
      ttsRate: (json['ttsRate'] as num?)?.toDouble() ?? 0.5,
    );

Map<String, dynamic> _$GameOptionsToJson(GameOptions instance) =>
    <String, dynamic>{
      'apiKey': instance.apiKey,
      'ttsRate': instance.ttsRate,
    };
