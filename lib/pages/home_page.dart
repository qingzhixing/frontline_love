import 'package:flutter/material.dart';

import '../theme.dart';
import 'keyboard_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 当前子项索引
  int currentIndex = 0;
  void onNevigationTap(int index) {
    currentIndex = index;
    setState(() {});
  }

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
          child: KeyboardGrid(),
        ),
      ),
    );
  }
}
