import 'package:flutter/material.dart';

const String customFont = "QingKeHuangYou-Regular";

var uiTheme = ThemeData(
  // 去掉水波纹效果
  // splashColor: Colors.transparent,
  // 去掉长按效果
  // highlightColor: Colors.transparent,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    // 显示选中的文字
    showSelectedLabels: true,
    // 显示不选中时的问题
    showUnselectedLabels: false,
    elevation: 0,
    backgroundColor: Colors.transparent,
    selectedItemColor: Colors.blueAccent,
    unselectedItemColor: Colors.grey,
    selectedIconTheme: IconThemeData(
      size: 28,
    ),
    unselectedIconTheme: IconThemeData(
      size: 24,
    ),
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
    type: BottomNavigationBarType.fixed, // 固定宽度
  ),

  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontFamily: "QingKeHuangYou-Regular",
      fontSize: 16,
      wordSpacing: 4,
    ),
    headlineLarge: TextStyle(
      fontFamily: "QingKeHuangYou-Regular",
      fontSize: 25,
      wordSpacing: 4,
      fontWeight: FontWeight.normal,
    ),
    labelSmall: TextStyle(
      fontFamily: "QingKeHuangYou-Regular",
      fontSize: 13,
      wordSpacing: 2,
      fontWeight: FontWeight.normal,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
  useMaterial3: true,
);
