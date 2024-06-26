import 'package:flutter/material.dart';
import 'package:todoapp/Config/colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 38,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: Colors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.onPrimaryColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: Colors.grey,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ))),
  );
}
