import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Color(0xFFE50914),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFE50914),
      foregroundColor: Colors.white,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFE50914),
        foregroundColor: Colors.white,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // quando focado
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // quando não focado
      ),
      filled: true,
      fillColor: Colors.white,
    ),

    textTheme: const TextTheme(
      titleSmall: TextStyle(color: Colors.white, fontSize: 14),
      titleMedium: TextStyle(color: Colors.white, fontSize: 16),
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}
