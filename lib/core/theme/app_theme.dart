import 'package:flutter/material.dart';
import 'theme_constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: ThemeConstants.primaryLight,
      secondary: ThemeConstants.secondaryLight,
      surface: ThemeConstants.surfaceLight,
      error: ThemeConstants.errorLight,
      onSecondary: ThemeConstants.primaryDark,
      onSecondaryContainer: ThemeConstants.textFieldBackgroundColorLight,
    ),

    scaffoldBackgroundColor: ThemeConstants.backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: ThemeConstants.backgroundLight,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ThemeConstants.primaryLight, width: 2),
      ),
      hintStyle: TextStyle(color: Colors.grey[600]),
      filled: true,
      fillColor: ThemeConstants.textFieldBackgroundColorLight,
      focusColor: ThemeConstants.primaryDark,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ThemeConstants.primaryLight,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
    cardTheme: CardThemeData(
      color: ThemeConstants.surfaceLight,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeConstants.primaryLight,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: ThemeConstants.primaryDark,
      secondary: ThemeConstants.secondaryDark,
      surface: ThemeConstants.surfaceDark,
      error: ThemeConstants.errorDark,
      onSecondary: Colors.white,
      onSecondaryContainer: ThemeConstants.textFieldBackgroundColorDark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ThemeConstants.primaryDark,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
     inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ThemeConstants.primaryLight, width: 2),
      ),
      hintStyle: TextStyle(color: Colors.grey[600]),
      filled: true,
      fillColor: ThemeConstants.textFieldBackgroundColorDark,
      focusColor: ThemeConstants.primaryDark,
    ),

    scaffoldBackgroundColor: ThemeConstants.backgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: ThemeConstants.surfaceDark,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    
    cardTheme: CardThemeData(
      color: ThemeConstants.surfaceDark,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeConstants.primaryDark,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
    ),
  );
}
