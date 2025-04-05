import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我要玩纷争前线!"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/icon/icon.png"),
              width: 200,
              height: 200,
            ),
            const Text("@qingzhixing"),
            TextButton(
              onPressed: () {
                launchUrlString(
                  "https://github.com/qingzhixing/frontline_love",
                  mode: LaunchMode.externalApplication,
                );
              },
              child: const Text("Github"),
            )
          ],
        ),
      ),
    );
  }
}
