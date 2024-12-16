import 'package:flutter/material.dart';

const String customFont = "QingKeHuangYou-Regular";

var uiTheme = ThemeData(
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
