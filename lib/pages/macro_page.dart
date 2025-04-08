import 'package:flutter/material.dart';
import 'package:frontline_love/macro_parser.dart';
import 'package:frontline_love/pages/ff14_command_editor.dart';
import 'package:frontline_love/widgets/background_scaffold.dart';

import '../theme.dart';
import '../widgets/custom_app_bar.dart';

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
  final ff14CommandEditor = FF14CommandEditor();
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
                ff14CommandEditor,
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MacroOutlinedButton(
                      buttonChild: Text(
                        "帮助",
                        style: textButtonTextStyle,
                      ),
                      onPressed: () {
                        _showHelpDialog(context);
                      },
                    ),
                    MacroOutlinedButton(
                      buttonChild: Text(
                        "清空",
                        style: textButtonTextStyle,
                      ),
                      onPressed: () {
                        ff14CommandEditor.codeController.text = "";
                        setState(() {});
                      },
                    ),
                    MacroOutlinedButton(
                      buttonChild: const Text(
                        "播放",
                        style: textButtonTextStyle,
                      ),
                      onPressed: () {
                        MacroParser.parse(
                            ff14CommandEditor.codeController.text);
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

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('宏指令帮助'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('支持指令:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('• /wait [秒数] - 等待指定时间'),
              Text('• <se.1>到<se.16> - 播放音效'),
              Text('• /p [消息] - 队伍聊天'),
              Text('• /ac "[技能名]" <目标> - 使用技能'),
              SizedBox(height: 16),
              Text('示例宏:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('/p 开始攻击！<se.6>\n'
                  '/ac "连击" <t>\n'
                  '/wait 1\n'
                  '/ac "正拳" <t>\n'
                  '/wait 1\n'
                  '/ac "崩拳" <t>'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('关闭'),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
