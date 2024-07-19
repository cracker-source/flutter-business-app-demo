import 'package:flutter/material.dart';

class ProductAvailabilityInfo extends StatelessWidget {
  const ProductAvailabilityInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: const [
          WidgetSpan(
            child: Icon(
              Icons.info_rounded,
              color: Colors.green,
              size: 16,
            ),
          ),
          TextSpan(
            text:
                " By default, the availability of the product will be marked as ",
          ),
          TextSpan(
            text: "IN STOCK. ",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "However, you can always change this in product section. ",
          ),
        ],
      ),
    );
  }
}
