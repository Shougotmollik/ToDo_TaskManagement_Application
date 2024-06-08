import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: Colors.grey,
      ),
    ),
  );
}
