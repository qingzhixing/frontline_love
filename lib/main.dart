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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            margin: const EdgeInsets.only(top: 3),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.purple.withOpacity(.5),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 2,
              ),
            ),
            child: const Center(
              child: Text(
                "我爱玩纷争前线",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  fontFamily: customFont,
                  letterSpacing: 5,
                ),
              ),
            ),
          ),
        ),
        body: const Center(
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
