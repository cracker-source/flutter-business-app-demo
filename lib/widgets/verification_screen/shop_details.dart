import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/widgets/verification_screen/shop_photos_container.dart';

import '../../bloc/verification/business_verification/business_verification_bloc.dart';
import '../../utils/utils.dart';

class ShopDetails extends StatelessWidget {
  const ShopDetails({super.key});

  void shopPhotosHandler(BuildContext context) async {
    final response = await pickMultipleImages();

    if (response.isNotEmpty && context.mounted) {
      context
          .read<BusinessVerificationBloc>()
          .add(BusinessVerificationShopPhotosEvent(shopPhotosList: response));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Business / Shop Photos",
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 15),
        const ShopPhotosContainer(),
        const SizedBox(height: 15),
        Text(
          "Submit 3-5 best pics of your shop while you are inside the shop or at the cash counter.",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          child: OutlinedButton(
              onPressed: () => shopPhotosHandler(context),
              child: const Text("Add pics")),
        ),
      ],
    );
  }
}
