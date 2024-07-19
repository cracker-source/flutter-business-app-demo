import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class AppButtonsTheme {
  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateColor.resolveWith(
        (states) => AppColors.primaryColor,
      ),
      foregroundColor: WidgetStateColor.resolveWith((states) => Colors.white),
    ),
  );

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateColor.resolveWith(
        (states) => AppColors.accentColor,
      ),
      side: WidgetStateBorderSide.resolveWith(
        (states) => const BorderSide(
          color: Colors.transparent,
        ),
      ),
      foregroundColor: WidgetStateColor.resolveWith(
        (states) => AppColors.primaryColor,
      ),
      textStyle: WidgetStateProperty.resolveWith(
        (states) => GoogleFonts.interTight(
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
      ),
    ),
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateColor.resolveWith(
        (states) => AppColors.primaryColor,
      ),
      foregroundColor: WidgetStateColor.resolveWith((states) => Colors.white),
    ),
  );

  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateColor.resolveWith(
        (states) => AppColors.darkOutlinedButtonColor,
      ),
      side: WidgetStateBorderSide.resolveWith(
        (states) => BorderSide(
          color: AppColors.darkOutlinedButtonColor,
        ),
      ),
      foregroundColor: WidgetStateColor.resolveWith(
        (states) => Colors.white,
      ),
      textStyle: WidgetStateProperty.resolveWith(
        (states) => GoogleFonts.interTight(
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
