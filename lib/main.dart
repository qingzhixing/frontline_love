import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:frontline_love/theme.dart';
import 'dart:developer' as developer;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我要打纷争前线!',
      theme: uiTheme,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    playSound(int soundEffectIndex) async {
      if (soundEffectIndex < 1 || soundEffectIndex > 16) {
        developer.log("Invalid sound effect index$soundEffectIndex");
        return;
      }
      var tempPlayer = AudioPlayer();
      await tempPlayer.play(AssetSource(
        "audio/se$soundEffectIndex.mp3",
      ));
    }

    var mainGrid = GridView.builder(
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
            backgroundColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.surfaceBright,
            ),
          ),
          child: Text(
            "se.${index + 1}",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        );
      },
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(
            child: FractionallySizedBox(
              widthFactor: 0.5,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "我最爱玩:",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "纷争前线",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.95,
              heightFactor: 0.7,
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    mainGrid,
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
