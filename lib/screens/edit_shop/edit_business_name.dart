import 'package:flutter/material.dart';
import 'package:social/widgets/edit_shop/edit_shop.dart';

class EditBusinessName extends StatelessWidget {
  const EditBusinessName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditShop(
        appBarName: "Edit business name",
        inputName: "Enter new business name",
        saveHandler: () {},
        inputIcon: Icons.business_center_outlined,
      ),
    );
  }
}
