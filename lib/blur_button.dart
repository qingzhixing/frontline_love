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
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.white),
            backgroundColor: WidgetStateProperty.all(
                widget.buttonColor ?? Colors.transparent),
            shadowColor: WidgetStateProperty.all(Colors.transparent),
            // overlayColor: WidgetStateProperty.all(Colors.transparent),
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.boarderRadius ?? 0),
              ),
            ),
          ),
          onPressed: widget.onPressed,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.boarderRadius ?? 0),
              gradient: LinearGradient(
                begin: Alignment.lerp(
                      Alignment.centerLeft,
                      Alignment.topCenter,
                      0.2,
                    ) ??
                    Alignment.topCenter,
                end: Alignment.lerp(
                      Alignment.centerRight,
                      Alignment.bottomCenter,
                      0.1,
                    ) ??
                    Alignment.topCenter,
                stops: const [0.0, 0.01, 0.99, 1.0],
                colors: [
                  Colors.white.withOpacity(0.8),
                  Colors.white.withOpacity(0.2),
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.8),
                ],
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: widget.child ?? Container(),
          ),
        ),
      ),
    );
  }
}
