import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:frontline_love/theme.dart';

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
    playSound() async {
      var tempPlayer = AudioPlayer();
      await tempPlayer.play(AssetSource(
        "audio/se1.mp3",
      ));
    }

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
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: playSound,
        tooltip: 'Play Sound',
        child: const Icon(Icons.audiotrack_outlined),
      ),
    );
  }
}
