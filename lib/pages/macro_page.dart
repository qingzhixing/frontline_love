import 'package:flutter/material.dart';
import 'package:frontline_love/background_scaffold.dart';

import '../theme.dart';

class MacroPage extends StatefulWidget {
  const MacroPage({super.key});

  @override
  State<MacroPage> createState() => _MacroPageState();
}

class _MacroPageState extends State<MacroPage> {
  final _scrollController = ScrollController();
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
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  maxLines: 15, // null 表示不限制行数，根据内容自动扩展
                  scrollPhysics:
                      const AlwaysScrollableScrollPhysics(), // 始终启用滚动
                  scrollController: _scrollController,
                  keyboardType: TextInputType.multiline, // 设置键盘类型为多行
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withAlpha(200),
                    border: const OutlineInputBorder(),
                    hintText: '在此处粘贴宏内容',
                    hintStyle: const TextStyle(
                      fontFamily: customFont,
                      letterSpacing: 2,
                    ),
                  ),
                  onChanged: (text) {
                    // 自动滚动到最后一行
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollController
                          .jumpTo(_scrollController.position.maxScrollExtent);
                    });
                  },
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.white.withAlpha(200),
                        ),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "清空",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontFamily: customFont,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.white.withAlpha(200),
                        ),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "播放",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontFamily: customFont,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
