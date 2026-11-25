import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF080B10);
  static const Color surface = Color(0xFF171E29);
  static const Color surfaceBorder = Color(0xFF232D3F);
  static const Color primaryTeal = Color(0xFF00C9A7);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color danger = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: primaryTeal,
        secondary: primaryTeal,
        surface: surface,
        error: danger,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: surfaceBorder, width: 1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: const TextStyle(color: textSecondary, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: surfaceBorder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryTeal, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryTeal,
          foregroundColor: background,
          minimumSize: const Size(double.infinity, 52),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}