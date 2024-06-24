import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    roomId = widget.initialRoomId;
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final worldValue = ref.watch(worldProvider(widget.worldId));
    final roomValue = ref.watch(roomProvider(roomId));
    return worldValue.when(
      data: (final world) => roomValue.when(
        data: (final room) => SimpleScaffold(
          title: '${world.name} - ${room.name}',
          body: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                autofocus: true,
                title: const Text('Description'),
                subtitle: Text(room.description),
                onTap: () {},
              ),
            ],
          ),
        ),
        error: ErrorListView.withPositional,
        loading: LoadingWidget.new,
      ),
      error: ErrorScreen.withPositional,
      loading: LoadingScreen.new,
    );
  }
}
