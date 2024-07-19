import 'package:flutter/material.dart';

import '../../widgets/edit_shop/edit_shop.dart';

class EditOwnerName extends StatelessWidget {
  const EditOwnerName({super.key});

  @override
  Widget build(BuildContext context) {
    return EditShop(
      appBarName: "Edit owner name",
      inputName: "Enter owner name",
      saveHandler: () {},
      inputIcon: Icons.person_outline,
    );
  }
}
