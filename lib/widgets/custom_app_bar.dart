import 'package:flutter/material.dart';

import '../theme.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required String text,
    Color textColor = Colors.deepOrange,
    List<Shadow> textShadows = const [
      Shadow(
        offset: Offset(1, 1),
        blurRadius: 2,
        color: Colors.black,
      )
    ],
    Color containerColor = const Color.fromRGBO(68, 138, 255, 0.5),
    Color borderColor = const Color.fromRGBO(255, 255, 255, 0.2),
  }) : super(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            margin: const EdgeInsets.only(top: 3),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: containerColor,
              border: Border.all(
                color: borderColor,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  fontFamily: customFont,
                  shadows: textShadows,
                  letterSpacing: 5,
                ),
              ),
            ),
          ),
        );
}
