import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorsManager.mainOrange,
    scaffoldBackgroundColor: ColorsManager.white,
    
    // شكل الـ AppBar الموحد
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorsManager.darkBlue),
      titleTextStyle: TextStyle(
        color: ColorsManager.darkBlue,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    // شكل الـ Buttons الموحد
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.mainOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: ColorsManager.white,
        ),
      ),
    ),

    // شكل الـ TextField (Input) الموحد
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManager.lightGrey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: ColorsManager.mainOrange),
      ),
    ),
  );
}