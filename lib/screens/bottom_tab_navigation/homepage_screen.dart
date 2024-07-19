import 'package:flutter/material.dart';
import 'package:social/widgets/shop_screen/shop_contact_details.dart';

import '../../utils/colors.dart';
import '../../widgets/homepage_screen/header_title.dart';
import '../../widgets/homepage_screen/row_one.dart';
import '../../widgets/homepage_screen/row_two.dart';
import '../../widgets/shop_screen/shop_available_payments.dart';
import '../../widgets/homepage_screen/offers_slider.dart';
import '../../widgets/shop_screen/info_card.dart';
import '../../widgets/shop_screen/precautions.dart';
import '../../widgets/shop_screen/shop_status.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderTitle(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OffersSlider(),
              const SizedBox(height: 30),
              Column(
                children: [
                  const RowOne(),
                  const RowTwo(),
                  const SizedBox(height: 10),
                  const ShopStatus(),
                  Divider(color: AppColors.inputFillColor, thickness: 4),
                  const InfoCard(
                    icon: Icons.payment_outlined,
                    infoCardName: "Available payments",
                    widget: ShopAvailablePayments(),
                  ),
                  Divider(color: AppColors.inputFillColor, thickness: 4),
                  const ShopContactDetails(),
                  Divider(color: AppColors.inputFillColor, thickness: 4),
                  const InfoCard(
                    infoCardName: "Precautions",
                    widget: Precautions(),
                    icon: Icons.list_alt,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
