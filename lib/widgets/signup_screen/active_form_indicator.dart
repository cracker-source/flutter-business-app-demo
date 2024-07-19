import 'package:flutter/material.dart';
import 'package:social/utils/colors.dart';

import 'form_indicator.dart';

class ActiveFormIndicator extends StatelessWidget {
  final int currentlyActiveIndex;

  const ActiveFormIndicator({
    super.key,
    required this.currentlyActiveIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: AnimatedContainer(
              width: 10,
              height: 10,
              color: currentlyActiveIndex >= 0
                  ? AppColors.primaryColor
                  : Colors.grey.shade300,
              duration: const Duration(seconds: 1),
              curve: Curves.easeIn,
            ),
          ),
          FormIndicator(
            currentlyActiveIndex: currentlyActiveIndex,
            requiredActiveNumber: 1,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: AnimatedContainer(
              width: 10,
              height: 10,
              color: currentlyActiveIndex >= 1
                  ? AppColors.primaryColor
                  : Colors.grey.shade300,
              duration: const Duration(seconds: 1),
              curve: Curves.easeOutSine,
            ),
          ),
          FormIndicator(
            currentlyActiveIndex: currentlyActiveIndex,
            requiredActiveNumber: 2,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: AnimatedContainer(
              width: 10,
              height: 10,
              color: currentlyActiveIndex >= 2
                  ? AppColors.primaryColor
                  : Colors.grey.shade300,
              duration: const Duration(seconds: 1),
              curve: Curves.easeOutSine,
            ),
          ),
          FormIndicator(
            currentlyActiveIndex: currentlyActiveIndex,
            requiredActiveNumber: 3,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: AnimatedContainer(
              width: 10,
              height: 10,
              color: currentlyActiveIndex >= 3
                  ? AppColors.primaryColor
                  : Colors.grey.shade300,
              duration: const Duration(seconds: 1),
              curve: Curves.easeOutSine,
            ),
          ),
        ],
      ),
    );
  }
}
