import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  );
}
