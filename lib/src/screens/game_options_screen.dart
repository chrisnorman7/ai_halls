import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/providers.dart';

/// The game options screen.
class GameOptionsScreen extends ConsumerWidget {
  /// Create an instance.
  const GameOptionsScreen({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(gameOptionsProvider);
    return Cancel(
      child: SimpleScaffold(
        actions: [
          TextButton(
            onPressed: () {
              final uri =
                  Uri.parse('https://platform.openai.com/account/api-keys');
              launchUrl(uri);
            },
            child: const Text('API Keys'),
          ),
        ],
        title: 'Game Options',
        body: value.when(
          data: (final options) => ListView(
            shrinkWrap: true,
            children: [
              TextListTile(
                value: options.apiKey ?? '',
                onChanged: (final apiKey) async {
                  options.apiKey = apiKey;
                  await options.save(ref: ref, invalidateProviders: true);
                },
                header: 'Open AI API Key',
                autofocus: true,
              ),
              DoubleListTile(
                value: options.ttsRate,
                onChanged: (final ttsRate) async {
                  options.ttsRate = ttsRate;
                  await options.save(ref: ref, invalidateProviders: true);
                },
                title: 'TTS Rate',
                min: 0.0,
                max: 2.0,
              ),
            ],
          ),
          error: ErrorListView.withPositional,
          loading: LoadingWidget.new,
        ),
      ),
    );
  }
}
