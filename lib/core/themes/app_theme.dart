import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Blue Monochromatic Palette
  static const Color bluePrimary = Color(0xFF3B82F6); // Vibrant Blue
  static const Color blueLight = Color(0xFF60A5FA); // Light Blue
  static const Color blueLighter = Color(0xFFDBEAFE); // Very Light Blue
  static const Color blueDark = Color(0xFF1E40AF); // Dark Blue
  static const Color blueVeryDark = Color(0xFF0C2340); // Very Dark Blue

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: bluePrimary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: bluePrimary,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme)
          .copyWith(
            headlineLarge: GoogleFonts.spaceGrotesk(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: blueVeryDark,
            ),
            headlineMedium: GoogleFonts.spaceGrotesk(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: blueDark,
            ),
            titleLarge: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: blueDark,
            ),
            bodyLarge: GoogleFonts.inter(
              fontSize: 16,
              color: const Color(0xFF475569),
            ),
            bodyMedium: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF64748B),
            ),
          ),
      scaffoldBackgroundColor: const Color(0xFFFAFAFA),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.spaceGrotesk(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: blueDark,
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  static ThemeData get DarkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: blueLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: blueLight,
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme)
          .copyWith(
            headlineLarge: GoogleFonts.spaceGrotesk(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: blueLighter,
            ),
            headlineMedium: GoogleFonts.spaceGrotesk(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: blueLight,
            ),
            titleLarge: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: blueLight,
            ),
            bodyLarge: GoogleFonts.inter(
              fontSize: 16,
              color: const Color(0xFFCBD5E1),
            ),
            bodyMedium: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF94A3B8),
            ),
          ),
      scaffoldBackgroundColor: blueVeryDark,
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1E3A5F),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.spaceGrotesk(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: blueLight,
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1E3A5F),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
