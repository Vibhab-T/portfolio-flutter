import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/app_theme.dart';
import 'package:portfolio/pages/home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vibhab Timsina | Portfolio",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.DarkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: MobileConstrainedHome(
        isDarkMode: _isDarkMode,
        onThemeChanged: (isDark) {
          setState(() {
            _isDarkMode = isDark;
          });
        },
      ),
    );
  }
}

class MobileConstrainedHome extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const MobileConstrainedHome({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: HomePage(isDarkMode: isDarkMode, onThemeChanged: onThemeChanged),
      ),
    );
  }
}
