import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarTheme {
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 0,
    shadowColor: Colors.white,
    scrolledUnderElevation: 1.1,
    titleTextStyle: GoogleFonts.almarai(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),
    iconTheme: const IconThemeData(
      size: 22,
    ),
  );
}
