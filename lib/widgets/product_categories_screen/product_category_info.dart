import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../common/custom_sliver_subtitle.dart';

class ProductCategoryInfo extends StatelessWidget {
  const ProductCategoryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSliverSubtitle(
          subtitle: "The categories that are available in your shop.",
        ),

        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: const EdgeInsets.all(5),
            color: AppColors.chipColor,
            child: const Text(
              "Total categories - 8",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // Wrap(
        //   spacing: 6,
        //   crossAxisAlignment: WrapCrossAlignment.center,
        //   children: [
        //     const Icon(
        //       Icons.delivery_dining,
        //       color: Colors.blue,
        //     ),
        //     ClipRRect(
        //       borderRadius: BorderRadius.circular(50),
        //       child: Container(
        //         color: Colors.black,
        //         width: 4,
        //         height: 4,
        //       ),
        //     ),
        //     Text("Deliveries"),
        //     SizedBox(width: 10),
        //     const Icon(
        //       Icons.sell,
        //       color: Colors.blue,
        //     ),
        //     ClipRRect(
        //       borderRadius: BorderRadius.circular(50),
        //       child: Container(
        //         color: Colors.black,
        //         width: 4,
        //         height: 4,
        //       ),
        //     ),
        //     Text("Offers"),
        //   ],
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SizedBox(
            child: Text(
              "Sort  -  None",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ],
    );
  }
}
