import 'package:flutter/material.dart';

import '../../widgets/edit_shop/edit_shop.dart';

class EditBusinessEmail extends StatelessWidget {
  const EditBusinessEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return EditShop(
      appBarName: "Edit business email",
      inputName: "Enter new business email",
      saveHandler: () {},
      inputIcon: Icons.email_outlined,
    );
  }
}
