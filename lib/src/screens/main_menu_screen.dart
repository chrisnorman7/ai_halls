import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/util.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

import '../providers/providers.dart';
import 'game_options_screen.dart';

/// The main menu for the game.
class MainMenuScreen extends ConsumerWidget {
  /// Create an instance.
  const MainMenuScreen({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final future = load(ref);
    return SimpleFutureBuilder(
      future: future,
      done: (final context, final _) {
        final value = ref.watch(worldsProvider);
        return CommonShortcuts(
          newCallback: () => newWorld(ref),
          child: SimpleScaffold(
            title: 'Main Menu',
            body: value.when(
              data: (final worlds) => ListView(
                shrinkWrap: true,
                children: [
                  ...worlds.map(
                    (final world) => CommonShortcuts(
                      deleteCallback: () => confirm(
                        context: context,
                        message:
                            'Are you sure you want to delete ${world.name}?',
                        title: 'Confirm Delete',
                        yesCallback: () async {
                          Navigator.pop(context);
                          final database =
                              await ref.read(databaseProvider.future);
                          await database.worldsDao.deleteWorld(world);
                          ref.invalidate(worldsProvider);
                        },
                      ),
                      child: ListTile(
                        autofocus: world.id == worlds.first.id,
                        title: Text(world.name),
                        subtitle: Text(world.description),
                        onTap: () {},
                      ),
                    ),
                  ),
                  ListTile(
                    autofocus: worlds.isEmpty,
                    title: const Text('Settings'),
                    subtitle: const Text('Configure the game'),
                    onTap: () => context.pushWidgetBuilder(
                      (final builderContext) => const GameOptionsScreen(),
                    ),
                  ),
                ],
              ),
              error: ErrorListView.withPositional,
              loading: LoadingWidget.new,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => newWorld(ref),
              tooltip: 'New World',
              child: const Icon(Icons.new_label_outlined),
            ),
          ),
        );
      },
      loading: (final context) => const LoadingScreen(),
      error: ErrorScreen.withPositional,
    );
  }

  /// Load everything.
  Future<void> load(final WidgetRef ref) async {
    await SoLoud.instance.init();
  }

  /// Create a new world.
  Future<void> newWorld(final WidgetRef ref) async {
    final database = await ref.read(databaseProvider.future);
    await database.worldsDao.createWorld(
      name: 'Untitled World',
      description: 'A new world, just waiting to be described.',
    );
    ref.invalidate(worldsProvider);
  }
}
