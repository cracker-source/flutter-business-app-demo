import 'package:flutter/material.dart';

import '../../widgets/edit_shop/edit_shop.dart';

class EditBusinessNumber extends StatelessWidget {
  const EditBusinessNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return EditShop(
      appBarName: "Edit business number",
      inputName: "Enter new business number",
      saveHandler: () {},
      inputIcon: Icons.phone_outlined,
    );
  }
}
