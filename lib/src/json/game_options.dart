import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../providers/providers.dart';

part 'game_options.g.dart';

/// The game options.
@JsonSerializable()
class GameOptions {
  /// Create an instance.
  GameOptions({
    this.apiKey,
    this.ttsRate = 0.5,
  });

  /// Create an instance from a JSON object.
  factory GameOptions.fromJson(final Map<String, dynamic> json) =>
      _$GameOptionsFromJson(json);

  /// The filename for options.
  static const optionsFilename = 'game_options.json';

  /// The API key for Open AI.
  String? apiKey;

  /// The TTS rate.
  double ttsRate;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$GameOptionsToJson(this);

  /// Save game options.
  Future<void> save({
    required final WidgetRef ref,
    required final bool invalidateProviders,
  }) async {
    final file = await ref.read(gameOptionsFileProvider.future);
    final json = jsonEncode(toJson());
    file.writeAsStringSync(json);
    if (invalidateProviders) {
      ref.invalidate(gameOptionsProvider);
    }
  }
}
