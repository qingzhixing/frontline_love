import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

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
        return TextButton(
          onPressed: () => playSound(index + 1),
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor:
                WidgetStateProperty.all(Colors.white.withOpacity(0.5)),
          ),
          child: Text(
            "se.${index + 1}",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        );
      },
    );
  }
}
