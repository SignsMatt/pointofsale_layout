import 'package:flutter/material.dart';
import 'package:pointofsale_layout/main_page.dart';
import 'package:pointofsale_layout/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var _themeMode = ThemeMode.light;

  void _toggleThemeMode() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: Scaffold(
        body: MainPage(
          isDarkMode: _themeMode == ThemeMode.dark,
          onToggleThemeMode: _toggleThemeMode,
        ),
      ),
    );
  }
}
