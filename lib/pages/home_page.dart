import 'package:flutter/material.dart';

import '../widgets/background_scaffold.dart';
import '../theme.dart';
import '../widgets/customAppBar.dart';
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
    return BackgroundScaffold(
      backgroundImageProvider:
          const AssetImage("assets/img/background_home.jpg"),
      scaffold: Scaffold(
        extendBody: true, //让主体内容延伸到导航栏后面
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          text: "我爱玩纷争前线",
          containerColor: Colors.purple.withAlpha(127),
          textColor: Colors.white,
        ),
        body: const Center(
          child: KeyboardGrid(),
        ),
      ),
    );
  }
}
