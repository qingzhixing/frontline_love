import 'package:flutter/material.dart';
import 'package:frontline_love/pages/macro_page.dart';
import 'package:frontline_love/pages/settings_page.dart';
import 'package:frontline_love/theme.dart';

import 'pages/about_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const FrontlineLoveApp());
}

class FrontlineLoveApp extends StatelessWidget {
  const FrontlineLoveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '纷争前线·指挥模拟器',
      theme: uiTheme,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomePage(),
          MacroPage(),
          AboutPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            backgroundColor: Colors.transparent,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.link,
            ),
            backgroundColor: Colors.transparent,
            label: 'Macro',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
            ),
            backgroundColor: Colors.transparent,
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            backgroundColor: Colors.transparent,
            label: 'Settings',
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
