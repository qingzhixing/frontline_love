import 'dart:async';

import 'ephemeral_audio_player.dart';

class MacroParser {
  static Completer? _currentMacroCompleter;
  static bool _isPlaying = false;
  static final List<Future> _activePlaybacks = [];

  static Future<void> parse(String macroText) async {
    if (_isPlaying) {
      await stop();
      await Future.delayed(const Duration(milliseconds: 50));
    }

    _isPlaying = true;
    _currentMacroCompleter = Completer();

    try {
      final lines = macroText.split('\n');
      for (final line in lines) {
        if (_currentMacroCompleter?.isCompleted ?? true) break;

        final trimmedLine = line.trim();
        if (trimmedLine.isEmpty || trimmedLine.startsWith('#')) continue;

        // 播放音效
        final seMatches =
            RegExp(r'<se\.([1-9]|1[0-6])>').allMatches(trimmedLine);
        if (seMatches.isNotEmpty) {
          await _playMultipleSounds(seMatches);
        }

        // 处理等待指令（支持/wait和<wait>两种格式）
        final waitTime = _parseWaitTime(trimmedLine);
        if (waitTime != null) {
          await _cancelableDelay(waitTime);
        } else {
          await _cancelableDelay(0.1); // 默认指令间隔
        }
      }
    } finally {
      await _cleanupPlaybacks();
      _isPlaying = false;
      _currentMacroCompleter = null;
    }
  }

  // 解析等待时间（支持两种格式）
  static double? _parseWaitTime(String line) {
    // 格式1: /wait 1.5
    final slashWaitMatch = RegExp(r'/wait (\d+(\.\d+)?)').firstMatch(line);
    if (slashWaitMatch != null) {
      return double.parse(slashWaitMatch.group(1)!);
    }

    // 格式2: <wait.1.5>
    final angleWaitMatch = RegExp(r'<wait\.(\d+(\.\d+)?)>').firstMatch(line);
    if (angleWaitMatch != null) {
      return double.parse(angleWaitMatch.group(1)!);
    }

    return null;
  }

  static Future<void> _playMultipleSounds(Iterable<RegExpMatch> matches) async {
    final playFutures = <Future>[];

    for (final match in matches) {
      if (_currentMacroCompleter?.isCompleted ?? true) break;

      final seNumber = match.group(1);
      final playback = EphemeralAudioPlayer.playAndDispose(
          assetPath: "audio/se$seNumber.mp3");
      _activePlaybacks.add(playback);
      playFutures.add(playback);
    }

    await Future.any([
      Future.wait(playFutures),
      _currentMacroCompleter?.future ?? Future.value(),
    ]);
  }

  static Future<void> _cancelableDelay(double seconds) async {
    if (_currentMacroCompleter == null) return;

    await Future.any([
      Future.delayed(Duration(milliseconds: (seconds * 1000).round())),
      _currentMacroCompleter!.future,
    ]);
  }

  static Future<void> stop() async {
    _currentMacroCompleter?.complete();
    await _cleanupPlaybacks();
  }

  static Future<void> _cleanupPlaybacks() async {
    _activePlaybacks.clear();
  }
}
