import 'package:flutter/material.dart';

class ShopAvailablePayments extends StatelessWidget {
  const ShopAvailablePayments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          "Types of payments that your are accepting",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/vegetables.jpg",
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Google Pay",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/vegetables.jpg",
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Phonepe",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/vegetables.jpg",
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Paytm",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/vegetables.jpg",
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Cash",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/vegetables.jpg",
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Bharat pe",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
