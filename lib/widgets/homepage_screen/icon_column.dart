import 'package:flutter/material.dart';
import 'package:social/utils/colors.dart';

class IconColumn extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback tapHandler;

  const IconColumn({
    super.key,
    required this.icon,
    required this.title,
    required this.tapHandler,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapHandler,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Icon(
              icon,
              color: AppColors.homepageIconColor,
              size: 26,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
