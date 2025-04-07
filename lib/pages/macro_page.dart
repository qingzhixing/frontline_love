import 'package:flutter/material.dart';
import 'package:frontline_love/widgets/background_scaffold.dart';
import 'package:code_text_field/code_text_field.dart';

import 'dart:developer' as developer;

import '../theme.dart';
import '../widgets/customAppBar.dart';

var ff14LanguageController = CodeController(stringMap: {});

const textButtonTextStyle = TextStyle(
  color: Colors.blueAccent,
  fontFamily: customFont,
  fontWeight: FontWeight.normal,
  letterSpacing: 2,
  fontSize: 20,
);

class MacroOutlinedButton extends StatefulWidget {
  final Widget buttonChild;
  final VoidCallback? onPressed;
  const MacroOutlinedButton({
    super.key,
    required this.buttonChild,
    this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _MacroOutlinedButton();
}

class _MacroOutlinedButton extends State<MacroOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.black, width: 1.0),
        backgroundColor: Colors.white.withAlpha(200),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: widget.buttonChild,
      ),
    );
  }
}

class MacroPage extends StatefulWidget {
  const MacroPage({super.key});

  @override
  State<MacroPage> createState() => _MacroPageState();
}

class _MacroPageState extends State<MacroPage>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();
  final _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用
    return BackgroundScaffold(
      backgroundImageProvider:
          const AssetImage("assets/img/background_macro.jpg"),
      scaffold: Scaffold(
        extendBody: true, //让主体内容延伸到导航栏后面
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          text: "宏指令",
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _textFieldController,
                  style: const TextStyle(
                    fontFamily: customFont,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),

                  maxLines: 15, // null 表示不限制行数，根据内容自动扩展
                  scrollPhysics:
                      const AlwaysScrollableScrollPhysics(), // 始终启用滚动
                  scrollController: _scrollController,
                  keyboardType: TextInputType.multiline, // 设置键盘类型为多行
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withAlpha(200),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "在此处粘贴宏内容",
                    hintStyle: const TextStyle(
                      fontFamily: customFont,
                      fontSize: 18,
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
                    MacroOutlinedButton(
                      buttonChild: const Text(
                        "清空",
                        style: textButtonTextStyle,
                      ),
                      onPressed: () {
                        _textFieldController.text = "";
                        setState(() {});
                      },
                    ),
                    MacroOutlinedButton(
                      buttonChild: const Text(
                        "播放",
                        style: textButtonTextStyle,
                      ),
                      onPressed: () {
                        developer.log(_textFieldController.text);
                      },
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

  @override
  bool get wantKeepAlive => true;
}
