import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/verification/business_verification/business_verification_bloc.dart';
import 'default_image_container.dart';

class ShopPhotosContainer extends StatelessWidget {
  const ShopPhotosContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessVerificationBloc, BusinessVerificationState>(
      buildWhen: (previous, current) {
        return previous.businessVerification.shopPhotosList !=
            current.businessVerification.shopPhotosList;
      },
      builder: ((context, state) {
        if (state is BusinessVerificationShopAddedState) {
          return Card(
            elevation: 0,
            color: Colors.white,
            clipBehavior: Clip.hardEdge,
            child: Wrap(
              children: [
                ...List.generate(
                  state.businessVerification.shopPhotosList.length <= 5
                      ? state.businessVerification.shopPhotosList.length
                      : 5,
                  (index) => Image.file(
                    File(state.businessVerification.shopPhotosList[index].path),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width /
                        (state.businessVerification.shopPhotosList.length <= 5
                            ? state.businessVerification.shopPhotosList.length
                            : 5) *
                        0.88,
                    height: MediaQuery.of(context).size.height / 4.9,
                  ),
                )
              ],
            ),
          );
        } else {
          return const DefaultImageContainer();
        }
      }),
    );
  }
}
