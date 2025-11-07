import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/app_theme.dart';
import 'package:portfolio/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vibhab Timsina | Portfolio",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.LightTheme,
      home: const MobileConstrainedHome(),
    );
  }
}

// Wrapper widget that constrains the app to mobile width
class MobileConstrainedHome extends StatelessWidget {
  const MobileConstrainedHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 420,
          maxHeight: 900,
        ), // Standard mobile width
        color: Colors.grey.shade100,
        child: const HomePage(),
      ),
    );
  }
}
