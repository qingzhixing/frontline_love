import 'package:flutter/material.dart';
import 'package:frontline_love/keyboard_grid.dart';
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
        child: const Center(
          child: FractionallySizedBox(
            widthFactor: 0.95,
            heightFactor: 0.7,
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  KeyboardGrid(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
