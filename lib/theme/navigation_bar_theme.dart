import 'package:flutter/material.dart';
import 'package:social/utils/colors.dart';

class AppNavigationBarTheme {
  static NavigationBarThemeData lightNavigationBarTheme =
      NavigationBarThemeData(
    backgroundColor: Colors.white,
    shadowColor: Colors.grey.shade300,
    elevation: 20,
    height: 65,
    surfaceTintColor: Colors.white,
    indicatorColor: AppColors.primaryColor,
    indicatorShape: const CircleBorder(eccentricity: 0.0),
    labelTextStyle: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            color: AppColors.primaryColor,
            fontSize: 11,
          );
        }
        return const TextStyle(fontSize: 11);
      },
    ),
    iconTheme: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: Colors.white, size: 20);
        }
        return const IconThemeData(size: 25);
      },
    ),
  );
}
