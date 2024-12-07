import 'package:flutter/material.dart';

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
      fontWeight: FontWeight.bold,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
  useMaterial3: true,
);
