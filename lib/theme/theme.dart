import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social/theme/bottom_sheet_theme.dart';
import 'package:social/theme/custom_appbar_theme.dart';
import 'package:social/theme/fab_theme.dart';
import 'package:social/theme/navigation_bar_theme.dart';
import 'package:social/utils/colors.dart';
import 'package:social/theme/text_field_theme.dart';
import 'package:social/theme/text_theme.dart';

import 'app_chip_theme.dart';
import 'buttons_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    splashColor: AppColors.inputFillColor,
    colorScheme: const ColorScheme.light(surface: Colors.white),
    brightness: Brightness.light,
    textTheme: GoogleFonts.almaraiTextTheme(AppTextTheme.lightTextTheme),
    elevatedButtonTheme: AppButtonsTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppButtonsTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppTextFieldTheme.lightInputDecorationTheme,
    navigationBarTheme: AppNavigationBarTheme.lightNavigationBarTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),
    indicatorColor: AppColors.primaryColor,
    chipTheme: AppChipTheme.lightChipTheme,
    floatingActionButtonTheme: FabTheme.lightFabTheme,
    bottomSheetTheme: BottomSheetTheme.lightBottomsheetTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.interTightTextTheme(AppTextTheme.darkTextTheme),
    elevatedButtonTheme: AppButtonsTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AppButtonsTheme.darkOutlinedButtonTheme,
    navigationBarTheme: AppNavigationBarTheme.lightNavigationBarTheme,
  );
}
