import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppTextFieldTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: AppColors.primaryColor,
      ),
    ),
    labelStyle: WidgetStateTextStyle.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(color: AppColors.primaryColor);
        } else if (states.contains(WidgetState.error)) {
          return TextStyle(color: Colors.red.shade900);
        } else {
          return const TextStyle(color: Colors.grey);
        }
      },
    ),
    errorStyle: TextStyle(color: Colors.red.shade900),
    isDense: true,
    floatingLabelStyle: WidgetStateTextStyle.resolveWith(
      (states) {
        if (states.contains(WidgetState.error)) {
          return TextStyle(color: Colors.red.shade900);
        } else {
          return TextStyle(color: AppColors.primaryColor);
        }
      },
    ),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 241, 241, 241),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: AppColors.primaryColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.red.shade900,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.red.shade900,
      ),
    ),
    fillColor: AppColors.inputFillColor,
    prefixIconColor:
        WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.error)) {
        return Colors.red.shade900;
      } else if (states.contains(WidgetState.focused)) {
        return Colors.black;
      }
      return Colors.grey;
    }),
    suffixIconColor:
        WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.error)) {
        return Colors.red.shade900;
      } else if (states.contains(WidgetState.focused)) {
        return Colors.black;
      }
      return Colors.grey;
    }),
  );

  // DARK THEME TEXT-FIELD
}
