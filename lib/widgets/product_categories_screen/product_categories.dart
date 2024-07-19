import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCategories extends StatelessWidget {
  final List<dynamic> categories;

  const ProductCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => context.push(
            "/products/${"${categories[index]["categoryName"]}".toLowerCase().split(" ").join("-")}",
            extra: {
              "image": categories[index]["categoryImage"].toString(),
            },
          ),
          leading: Image.network(
            categories[index]["categoryImage"],
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          title: Text(categories[index]["categoryName"]),
          subtitle: const Text(
            "10 items",
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
      itemCount: categories.length,
    );
  }
}
