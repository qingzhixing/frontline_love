import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:frontline_love/blur_button.dart';

class KeyboardGrid extends StatefulWidget {
  const KeyboardGrid({super.key});

  @override
  State<StatefulWidget> createState() => _KeyboardGridState();
}

class _KeyboardGridState extends State<KeyboardGrid> {
  void playSound(int soundEffectIndex) async {
    if (soundEffectIndex < 1 || soundEffectIndex > 16) {
      developer.log("Invalid sound effect index$soundEffectIndex");
      return;
    }
    var tempPlayer = AudioPlayer();
    await tempPlayer.play(AssetSource(
      "audio/se$soundEffectIndex.mp3",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 16,
      itemBuilder: (context, index) {
        return BlurButton(
          boarderRadius: 10,
          blurSigma: 5,
          buttonColor: Colors.blue.withOpacity(0.1),
          onPressed: () => playSound(index + 1),
          child: Text(
            "se.${index + 1}",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        );
      },
    );
  }
}
