import 'package:flutter/material.dart';

class BackgroundScaffold extends StatefulWidget {
  final ImageProvider backgroundImageProvider;
  final Scaffold scaffold;

  const BackgroundScaffold({
    super.key,
    required this.backgroundImageProvider,
    required this.scaffold,
  });

  @override
  State<StatefulWidget> createState() => _BackgroundScaffoldState();
}

class _BackgroundScaffoldState extends State<BackgroundScaffold> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: widget.backgroundImageProvider,
          fit: BoxFit.cover,
        ),
      ),
      child: widget.scaffold,
    );
  }
}
