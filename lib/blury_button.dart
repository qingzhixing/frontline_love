import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

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
    return TextButton(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.transparent),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
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
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: widget.child ?? Container(),
      ).blurry(
        blur: 5,
        elevation: 0,
        color: widget.buttonColor ?? Colors.transparent,
        padding: const EdgeInsets.all(0),
        borderRadius: BorderRadius.circular(widget.boarderRadius ?? 0),
      ),
    );
  }
}
