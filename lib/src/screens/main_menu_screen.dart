import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

import '../database/database.dart';
import '../providers/providers.dart';
import 'worlds_screen.dart';

/// The main menu for the game.
class MainMenuScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const MainMenuScreen({
    super.key,
  });

  /// Create state for this widget.
  @override
  MainMenuScreenState createState() => MainMenuScreenState();
}

/// State for [MainMenuScreen].
class MainMenuScreenState extends ConsumerState<MainMenuScreen> {
  /// The database to use.
  late Database database;

  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    database.close();
    SoLoud.instance.deinit();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    database = ref.watch(databaseProvider);
    final future = load(ref);
    return SimpleFutureBuilder(
      future: future,
      done: (final context, final _) => const WorldsScreen(),
      loading: (final context) => const LoadingScreen(),
      error: ErrorScreen.withPositional,
    );
  }

  /// Load everything.
  Future<void> load(final WidgetRef ref) async {
    final soLoud = SoLoud.instance;
    if (!(await soLoud.initialized)) {
      await soLoud.init();
    }
  }
}
