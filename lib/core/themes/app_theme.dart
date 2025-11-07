import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get LightTheme {
    return ThemeData(
      primaryColor: const Color(0xFF1565C0),
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)),
      textTheme: GoogleFonts.poppinsTextTheme(),
      scaffoldBackgroundColor: const Color(0xFFF7F7F7),
      useMaterial3: true,
    );
  }
}
