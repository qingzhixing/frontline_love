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
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(widget.boarderRadius ?? 0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 0,
                offset: const Offset(3, 3),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                blurRadius: 0,
                offset: const Offset(-3, -3),
              ),
            ],
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(widget.buttonColor),
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              // overlayColor: WidgetStateProperty.all(Colors.transparent),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(widget.boarderRadius ?? 0),
                ),
              ),
            ),
            onPressed: widget.onPressed,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
