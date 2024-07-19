import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class FormIndicator extends StatelessWidget {
  final int currentlyActiveIndex;
  final int requiredActiveNumber;

  const FormIndicator({
    super.key,
    required this.currentlyActiveIndex,
    required this.requiredActiveNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        height: 2,
        color: currentlyActiveIndex >= requiredActiveNumber
            ? AppColors.primaryColor
            : Colors.grey.shade300,
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }
}
