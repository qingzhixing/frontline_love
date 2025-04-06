import 'package:flutter/material.dart';
import 'package:frontline_love/background_scaffold.dart';

import '../theme.dart';

class MacroPage extends StatefulWidget {
  const MacroPage({super.key});

  @override
  State<MacroPage> createState() => _MacroPageState();
}

class _MacroPageState extends State<MacroPage> {
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      backgroundImageProvider:
          const AssetImage("assets/img/background_macro.jpg"),
      scaffold: Scaffold(
        extendBody: true, //让主体内容延伸到导航栏后面
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            margin: const EdgeInsets.only(top: 3),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.blueAccent.withOpacity(.5),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 2,
              ),
            ),
            child: const Center(
              child: Text(
                "宏处理",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  fontFamily: customFont,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      color: Colors.black,
                    )
                  ],
                  letterSpacing: 5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
