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
      fontWeight: FontWeight.normal,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
  cardTheme: const CardTheme(
    color: Color.fromARGB(255, 186, 255, 255),
    shadowColor: Color.fromARGB(255, 139, 216, 216),
  ),
  useMaterial3: true,
);
