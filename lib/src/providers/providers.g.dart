// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stateDirectoryHash() => r'd416d38fe856686a921419e6fd9765222c62a9d1';

/// Provide the directory where state will be stored.
///
/// Copied from [stateDirectory].
@ProviderFor(stateDirectory)
final stateDirectoryProvider = AutoDisposeFutureProvider<Directory>.internal(
  stateDirectory,
  name: r'stateDirectoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stateDirectoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StateDirectoryRef = AutoDisposeFutureProviderRef<Directory>;
String _$gameOptionsFileHash() => r'3bb9d18a03fa47e9925c2a1819e32ed7db8d465e';

/// Provide the file where game options will be saved.
///
/// Copied from [gameOptionsFile].
@ProviderFor(gameOptionsFile)
final gameOptionsFileProvider = AutoDisposeFutureProvider<File>.internal(
  gameOptionsFile,
  name: r'gameOptionsFileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gameOptionsFileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GameOptionsFileRef = AutoDisposeFutureProviderRef<File>;
String _$gameOptionsHash() => r'2ba079ca251aff1e53160781fb07501997e957e8';

/// Provide game options.
///
/// Copied from [gameOptions].
@ProviderFor(gameOptions)
final gameOptionsProvider = AutoDisposeFutureProvider<GameOptions>.internal(
  gameOptions,
  name: r'gameOptionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gameOptionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GameOptionsRef = AutoDisposeFutureProviderRef<GameOptions>;
String _$ttsHash() => r'1d6ce0c7d32aabc12b4a43f6eab894740fe66541';

/// Provide the text-to-speech system.
///
/// Copied from [tts].
@ProviderFor(tts)
final ttsProvider = AutoDisposeProvider<FlutterTts>.internal(
  tts,
  name: r'ttsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ttsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TtsRef = AutoDisposeProviderRef<FlutterTts>;
String _$databaseHash() => r'5e10072adae4d637395b5b8e6a3ca7884e11fa36';

/// Provide the database.
///
/// Copied from [database].
@ProviderFor(database)
final databaseProvider = Provider<Database>.internal(
  database,
  name: r'databaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$databaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DatabaseRef = ProviderRef<Database>;
String _$worldsHash() => r'14e0ad2863d4e737e1b48110813c404a14f21c07';

/// Provide all worlds.
///
/// Copied from [worlds].
@ProviderFor(worlds)
final worldsProvider = AutoDisposeFutureProvider<List<World>>.internal(
  worlds,
  name: r'worldsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$worldsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WorldsRef = AutoDisposeFutureProviderRef<List<World>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
