import 'dart:convert';
import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../database/database.dart';
import '../json/game_options.dart';

part 'providers.g.dart';

/// Provide the directory where state will be stored.
@riverpod
Future<Directory> stateDirectory(final StateDirectoryRef ref) async {
  final documentsDirectory = await getApplicationDocumentsDirectory();
  final fullPath = path.join(documentsDirectory.path, 'ai_halls');
  final directory = Directory(fullPath);
  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }
  return directory;
}

/// Provide the file where game options will be saved.
@riverpod
Future<File> gameOptionsFile(final GameOptionsFileRef ref) async {
  final directory = await ref.watch(stateDirectoryProvider.future);
  return File(path.join(directory.path, GameOptions.optionsFilename));
}

/// Provide game options.
@riverpod
Future<GameOptions> gameOptions(final GameOptionsRef ref) async {
  final file = await ref.watch(gameOptionsFileProvider.future);
  if (file.existsSync()) {
    final json = jsonDecode(file.readAsStringSync());
    return GameOptions.fromJson(json);
  }
  return GameOptions();
}

/// Provide the text-to-speech system.
@riverpod
FlutterTts tts(final TtsRef ref) => FlutterTts();

/// Provide the database.
@Riverpod(keepAlive: true)
Database database(final DatabaseRef ref) {
  final database = Database();
  ref.onDispose(database.close);
  return database;
}

/// Provide all worlds.
@riverpod
Future<List<World>> worlds(final WorldsRef ref) {
  final database = ref.watch(databaseProvider);
  return database.worldsDao.getWorlds();
}

/// Provide a single world.
@riverpod
Future<World> world(final WorldRef ref, final int id) {
  final database = ref.watch(databaseProvider);
  return database.worldsDao.getWorld(id);
}
