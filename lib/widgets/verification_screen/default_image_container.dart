import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class DefaultImageContainer extends StatelessWidget {
  const DefaultImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 4.9,
      decoration: BoxDecoration(
        color: AppColors.inputFillColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: const Icon(
        Icons.add_a_photo_outlined,
        size: 30,
      ),
    );
  }
}
