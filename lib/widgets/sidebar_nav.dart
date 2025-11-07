import 'package:flutter/material.dart';

class SidebarNav extends StatelessWidget {
  final String? activeSection;
  final Function(String) onSectionChanged;
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const SidebarNav({
    super.key,
    this.activeSection,
    required this.onSectionChanged,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF334155)
                : const Color(0xFFE2E8F0),
            width: 1,
          ),
        ),
      ),
    );
  }
}
