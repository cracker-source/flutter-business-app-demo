import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../widgets/shop_screen/shop_gallery.dart';
import '../../../widgets/shop_screen/shop_header.dart';
import '../../widgets/shop_screen/info_card.dart';
import '../../widgets/shop_screen/shop_info_container.dart';
import '../../widgets/shop_screen/shop_settings.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.inputFillColor,
      body: CustomScrollView(
        slivers: [
          ShopHeader(),
          const SliverToBoxAdapter(
            child: ShopInfoContainer(),
          ),
          // const SliverToBoxAdapter(
          //   child: ShopStatus(),
          // ),
          // const SliverToBoxAdapter(
          //   child: ShopContactDetails(),
          // ),
          // const SliverToBoxAdapter(
          //   child: InfoCard(
          //     infoCardName: "Timings",
          //     widget: ShopTimings(),
          //     icon: Icons.timer_outlined,
          //   ),
          // ),
          const SliverToBoxAdapter(
            child: InfoCard(
              icon: Icons.photo_size_select_actual_outlined,
              infoCardName: "Gallery",
              widget: ShopGallery(),
            ),
          ),
          const SliverToBoxAdapter(
            child: ShopSettings(),
          ),
        ],
      ),
    );
  }
}
