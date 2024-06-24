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
String _$worldHash() => r'a234ed1918c19ec750af8e73c686731fddbe843a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provide a single world.
///
/// Copied from [world].
@ProviderFor(world)
const worldProvider = WorldFamily();

/// Provide a single world.
///
/// Copied from [world].
class WorldFamily extends Family<AsyncValue<World>> {
  /// Provide a single world.
  ///
  /// Copied from [world].
  const WorldFamily();

  /// Provide a single world.
  ///
  /// Copied from [world].
  WorldProvider call(
    int id,
  ) {
    return WorldProvider(
      id,
    );
  }

  @override
  WorldProvider getProviderOverride(
    covariant WorldProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'worldProvider';
}

/// Provide a single world.
///
/// Copied from [world].
class WorldProvider extends AutoDisposeFutureProvider<World> {
  /// Provide a single world.
  ///
  /// Copied from [world].
  WorldProvider(
    int id,
  ) : this._internal(
          (ref) => world(
            ref as WorldRef,
            id,
          ),
          from: worldProvider,
          name: r'worldProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$worldHash,
          dependencies: WorldFamily._dependencies,
          allTransitiveDependencies: WorldFamily._allTransitiveDependencies,
          id: id,
        );

  WorldProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<World> Function(WorldRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorldProvider._internal(
        (ref) => create(ref as WorldRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<World> createElement() {
    return _WorldProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorldProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WorldRef on AutoDisposeFutureProviderRef<World> {
  /// The parameter `id` of this provider.
  int get id;
}

class _WorldProviderElement extends AutoDisposeFutureProviderElement<World>
    with WorldRef {
  _WorldProviderElement(super.provider);

  @override
  int get id => (origin as WorldProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
