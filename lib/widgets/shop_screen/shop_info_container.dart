import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'icon_info.dart';

class ShopInfoContainer extends StatelessWidget {
  const ShopInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.categoryLabelColor,
            ),
            child: Text(
              "Food & Restaurant",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconInfo(
                color: AppColors.primaryColor,
                icon: Icons.favorite,
                text: "100K",
              ),
              const IconInfo(
                color: Colors.green,
                icon: Icons.verified_outlined,
                text: "Verified",
              ),
              IconInfo(
                color: AppColors.primaryColor,
                icon: Icons.gpp_good_outlined,
                text: "Active",
              ),
              const IconInfo(
                color: Colors.blue,
                icon: Icons.delivery_dining_outlined,
                text: "No Delivery",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
