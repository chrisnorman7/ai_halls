import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

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
      done: (final context, final _) => SimpleScaffold(
        title: 'Main Menu',
        body: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              autofocus: true,
              title: const Text('Settings'),
              subtitle: const Text('Configure the game'),
              onTap: () => context.pushWidgetBuilder(
                (final builderContext) => const GameOptionsScreen(),
              ),
            ),
          ],
        ),
      ),
      loading: (final context) => const LoadingScreen(),
      error: ErrorScreen.withPositional,
    );
  }

  /// Load everything.
  Future<void> load(final WidgetRef ref) async {
    await SoLoud.instance.init();
  }
}
