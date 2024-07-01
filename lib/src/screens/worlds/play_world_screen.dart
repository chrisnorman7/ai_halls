import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/util.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../gen/assets.gen.dart';
import '../../extensions.dart';
import '../../providers/providers.dart';

/// A screen to play a world.
class PlayWorldScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const PlayWorldScreen({
    required this.worldId,
    required this.initialRoomId,
    super.key,
  });

  /// The ID of the world to play.
  final int worldId;

  /// The ID of the room which the player starts in.
  final int initialRoomId;

  /// Create state for this widget.
  @override
  PlayWorldScreenState createState() => PlayWorldScreenState();
}

/// State for [PlayWorldScreen].
class PlayWorldScreenState extends ConsumerState<PlayWorldScreen> {
  /// The ID of the room which contains the player.
  late int roomId;

  /// The coordinates where the player is standing.
  late Point<double> coordinates;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    coordinates = const Point(0, 0);
    roomId = widget.initialRoomId;
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final database = ref.watch(databaseProvider);
    final tts = ref.watch(ttsProvider);
    final worldValue = ref.watch(worldProvider(widget.worldId));
    final roomValue = ref.watch(roomProvider(roomId));
    return worldValue.when(
      data: (final world) => roomValue.when(
        data: (final room) {
          final shortcuts = <GameShortcut>[
            GameShortcut(
              title: 'Speak coordinates',
              shortcut: GameShortcutsShortcut.keyC,
              onStart: (final innerContext) => tts.speakInterrupted(
                '${coordinates.x.floor()}, ${coordinates.y.floor()}',
              ),
            ),
            GameShortcut(
              title: 'Speak room name',
              shortcut: GameShortcutsShortcut.keyN,
              onStart: (final innerContext) => tts.speakInterrupted(room.name),
            ),
            GameShortcut(
              title: 'Speak room description',
              shortcut: GameShortcutsShortcut.keyD,
              onStart: (final innerContext) => tts.speakInterrupted(
                room.description,
              ),
            ),
            GameShortcut(
              title: 'Show objects',
              shortcut: GameShortcutsShortcut.keyX,
              onStart: (final innerContext) async {
                final earcon = Assets.earcons.object.asSound(
                  destroy: false,
                  soundType: SoundType.asset,
                );
                final objects = await database.roomObjectsDao.getRoomObjects(
                  room,
                );
                if (innerContext.mounted) {
                  await innerContext.pushWidgetBuilder(
                    (final context) => Cancel(
                      child: SimpleScaffold(
                        title: 'Room Objects',
                        body: ListView.builder(
                          itemBuilder: (final context, final index) {
                            final object = objects[index];
                            return PlaySoundSemantics(
                              sound: earcon.copyWith(
                                position: SoundPosition3d(
                                  object.x.toDouble(),
                                  object.y.toDouble(),
                                  0.0,
                                ),
                                looping: true,
                              ),
                              child: ListTile(
                                autofocus: index == 0,
                                title: Text(object.name),
                                subtitle: Text(object.description),
                                onLongPress: () =>
                                    setClipboardText(object.toString()),
                              ),
                            );
                          },
                          itemCount: objects.length,
                          shrinkWrap: true,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ];
          shortcuts.add(
            GameShortcut(
              title: 'Show help',
              shortcut: GameShortcutsShortcut.slash,
              controlKey: useControlKey,
              altKey: useMetaKey,
              onStart: (final innerContext) => innerContext.pushWidgetBuilder(
                (final builderContext) =>
                    GameShortcutsHelpScreen(shortcuts: shortcuts),
              ),
            ),
          );
          return SimpleScaffold(
            title: '${world.name} - ${room.name}',
            body: GameShortcuts(
              shortcuts: shortcuts,
              child: Text(room.name),
            ),
          );
        },
        error: ErrorListView.withPositional,
        loading: LoadingWidget.new,
      ),
      error: ErrorScreen.withPositional,
      loading: LoadingScreen.new,
    );
  }
}
