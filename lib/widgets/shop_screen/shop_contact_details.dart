import 'package:flutter/material.dart';
import 'package:social/widgets/shop_screen/icon_row_title.dart';

import 'icon_row_info.dart';

class ShopContactDetails extends StatelessWidget {
  const ShopContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 5),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const IconRowTitle(
              text: "Address",
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 15),
            Text(
              "Thogatapalem, Chandrapadia (village), Vinjamur (sub-district), Nellore (district), Andhra Pradesh - 524228",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 20),
            const IconRowInfo(
              icon: Icons.phone_outlined,
              text: "+91 8877777339",
            ),
            const SizedBox(height: 20),
            const IconRowInfo(
              icon: Icons.email_outlined,
              text: "demomailforshop@gmail.com",
            ),
            // const SizedBox(height: 20),
            // const IconRowInfo(
            //   icon: Icons.alternate_email,
            //   text: "vinayaka_fast_foods",
            // ),
            const SizedBox(height: 20),
            const IconRowInfo(
              icon: Icons.person_outline,
              text: "Kalyan Vinayaka",
            ),
          ],
        ),
      ),
    );
  }
}
