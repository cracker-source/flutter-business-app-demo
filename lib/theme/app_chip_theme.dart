import 'package:flutter/material.dart';
import 'package:social/utils/colors.dart';

class AppChipTheme {
  static ChipThemeData lightChipTheme = ChipThemeData(
    showCheckmark: false,
    side: BorderSide(
      color: AppColors.chipColor.withOpacity(0.1),
    ),
    selectedColor: AppColors.chipColor.withOpacity(0.3),
    labelStyle: const TextStyle(
      color: ChipLabelColor(),
      fontWeight: FontWeight.bold,
    ),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: AppColors.chipColor.withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

class ChipLabelColor extends Color implements WidgetStateColor {
  const ChipLabelColor() : super(_default);

  static const int _default = 0xFF000000;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return AppColors.chipColor; // Selected text color
    }
    return AppColors.chipColor; // normal text color
  }
}
