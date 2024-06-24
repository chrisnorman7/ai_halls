import 'dart:convert';

import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/util.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift_editors/drift_editors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../../database/database.dart';
import '../../providers/providers.dart';

/// A screen for editing a world.
class EditWorldScreen extends ConsumerWidget {
  /// Create an instance.
  const EditWorldScreen({
    required this.worldId,
    super.key,
  });

  /// The ID of the world to edit.
  final int worldId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final worlds = database.worlds;
    final value = ref.watch(
      worldProvider(
        worldId,
      ),
    );
    return Cancel(
      child: value.when(
        data: (final world) => CallbackShortcuts(
          bindings: {
            SingleActivator(
              LogicalKeyboardKey.keyP,
              control: useControlKey,
              meta: useMetaKey,
            ): () => playGame(ref, world),
          },
          child: DriftEditorScreen(
            columnHandlers: [
              StringColumnHandler(
                value: world.name,
                column: worlds.name,
              ),
              StringColumnHandler(
                value: world.description,
                column: worlds.description,
              ),
            ],
            title: 'Edit World',
            database: database,
            tableInfo: worlds,
            primaryKeyColumn: worlds.id,
            primaryKey: worldId,
            onChanged: () => invalidateProviders(ref),
            actions: [
              IconButton(
                onPressed: () => playGame(ref, world),
                icon: const Icon(
                  Icons.play_arrow_outlined,
                  semanticLabel: 'Play',
                ),
              ),
            ],
          ),
        ),
        error: ErrorScreen.withPositional,
        loading: LoadingScreen.new,
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref) => ref
    ..invalidate(worldsProvider)
    ..invalidate(worldProvider(worldId));

  /// Play the game.
  Future<void> playGame(final WidgetRef ref, final World world) async {
    final roomId = world.firstRoomId;
    if (roomId == null) {
      final generatedRoom = await generateRoom(ref: ref, world: world);
      setClipboardText(jsonEncode(generatedRoom.toJson()));
    }
  }
}
