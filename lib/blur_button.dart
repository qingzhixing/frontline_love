import 'dart:ui';

import 'package:flutter/material.dart';

class BlurButton extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final double? boarderRadius;
  final Color? buttonColor;
  final double? blurSigma;

  const BlurButton({
    super.key,
    this.child,
    this.onPressed,
    this.boarderRadius,
    this.buttonColor,
    this.blurSigma,
  });

  @override
  State<StatefulWidget> createState() => _BlurButtonState();
}

class _BlurButtonState extends State<BlurButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.boarderRadius ?? 0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.blurSigma ?? 0,
          sigmaY: widget.blurSigma ?? 0,
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.15, 0.85, 1.0],
              colors: [
                Colors.white.withOpacity(0.8),
                Colors.white.withOpacity(0.2),
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(Colors.white),
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(widget.boarderRadius ?? 0),
                ),
              ),
            ),
            onPressed: widget.onPressed,
            child: widget.child ?? Container(),
          ),
        ),
      ),
    );
  }
}
