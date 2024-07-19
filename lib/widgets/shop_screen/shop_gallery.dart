import 'package:flutter/material.dart';

class ShopGallery extends StatelessWidget {
  const ShopGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          "Showcase your shop to your customers",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 15),
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/vegetables.jpg"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.black45,
              child: const Center(
                child: Text(
                  "Click here to view all",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
