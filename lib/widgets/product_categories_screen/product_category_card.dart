import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/colors.dart';

class ProductCategoryCard extends StatelessWidget {
  final String categoryName;
  final String categoryImage;

  const ProductCategoryCard({
    super.key,
    required this.categoryName,
    required this.categoryImage,
  });

  Widget _frameBuilderHandler(context, child, frame, wasSynchronouslyLoaded) {
    if (wasSynchronouslyLoaded) return child;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: frame != null
          ? child
          : Container(
              color: AppColors.inputFillColor,
              width: double.infinity,
              height: 110,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      surfaceTintColor: Colors.white,
      child: InkWell(
        onTap: () => context.push(
          "/products/${categoryName.toLowerCase().split(" ").join("-")}",
          extra: {
            "image": categoryImage,
          },
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              categoryImage,
              frameBuilder: _frameBuilderHandler,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "10 Items",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.black54),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
