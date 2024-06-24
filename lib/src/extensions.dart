import 'package:flutter_tts/flutter_tts.dart';

/// Useful extensions on Flutter TTS.
extension FlutterTtsX on FlutterTts {
  /// Interrupt speech before speaking.
  Future<void> speakInterrupted(final String text) async {
    await stop();
    await speak(text);
  }
}
