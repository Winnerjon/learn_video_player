import 'package:flutter/material.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData light() => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: const TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.w600),
      iconTheme: IconThemeData(
        color: Colors.grey.shade800,
        size: 25,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    )
  );
}