import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:highlight/highlight.dart';

class FF14CommandEditor extends StatefulWidget {
  static final Mode ff14Language = Mode(
    case_insensitive: false,
    keywords: {
      'chat': ['/s', '/p', '/fc', '/l', '/y', '/sh', '/tell'],
      'emote': ['/emote', '/joy', '/cheer', '/dance', '/sit'],
      'macro': ['/macro', '/ac', '/action', '/wait', '/echo'],
      'system': ['/logout', '/busy', '/afk', '/invite', '/kick'],
      'sound': [
        '<se.1>',
        '<se.2>',
        '<se.3>',
        '<se.4>',
        '<se.5>',
        '<se.6>',
        '<se.7>',
        '<se.8>',
        '<se.9>',
        '<se.10>',
        '<se.11>',
        '<se.12>',
        '<se.13>',
        '<se.14>',
        '<se.15>',
        '<se.16>'
      ],
    },
    contains: [
      Mode(className: 'sound', begin: '<se\\.[1-9][0-6]?>', end: '>'),
      Mode(className: 'comment', begin: '#', end: '\n'),
      Mode(className: 'string', begin: '"', end: '"'),
      Mode(className: 'variable', begin: '\\b[0-9]{1,3}\\b'),
      Mode(className: 'meta', begin: '/[a-zA-Z]+'),
    ],
  );
  late final CodeController codeController;

  FF14CommandEditor({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FF14CommandEditorState();
}

class _FF14CommandEditorState extends State<FF14CommandEditor> {
  @override
  void initState() {
    super.initState();
    widget.codeController = CodeController(
      language: FF14CommandEditor.ff14Language,
      patternMap: {
        r'<se\.[1-9][0-6]?>': const TextStyle(
            color: Colors.greenAccent, fontWeight: FontWeight.bold),
        r'#.*': const TextStyle(color: Colors.grey), // 注释
        r'"/p"': const TextStyle(color: Colors.blue), // 队伍聊天
        r'"/ac"': const TextStyle(color: Colors.cyan), // 技能指令
        r'"/action"': const TextStyle(color: Colors.orange), // 技能指令别名
        r'/wait\s+\d+': const TextStyle(color: Colors.amber), // 等待时间
        r'<wait\.(\d+(\.\d+)?)>':
            const TextStyle(color: Colors.amber), // 等待时间别名,
        r'<等待\.(\d+(\.\d+)?)>': const TextStyle(color: Colors.amber), // 等待时间别名,
      },
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
  Widget build(BuildContext context) {
    return CodeField(
      controller: widget.codeController,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withAlpha(200),
      ),
      textStyle: const TextStyle(
        fontFamily: "monospace",
        fontSize: 18,
        letterSpacing: 1,
      ),
      maxLines: 5, // null 表示不限制行数，根据内容自动扩展
      keyboardType: TextInputType.multiline, // 设置键盘类型为多行
      horizontalScroll: true,
    );
  }
}
