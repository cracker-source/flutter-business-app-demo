import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/verification/business_verification/business_verification_bloc.dart';

import 'default_image_container.dart';

class PanCardImagesContainer extends StatelessWidget {
  const PanCardImagesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessVerificationBloc, BusinessVerificationState>(
      buildWhen: (previous, current) {
        return previous.businessVerification.panCardDetailsList !=
            current.businessVerification.panCardDetailsList;
      },
      builder: (context, state) {
        if (state is BusinessVerificationPanCardAddedState) {
          return Card(
            elevation: 0,
            color: Colors.white,
            clipBehavior: Clip.hardEdge,
            child: Wrap(
              spacing: 2,
              children: [
                ...List.generate(
                  state.businessVerification.panCardDetailsList.length <= 2
                      ? state.businessVerification.panCardDetailsList.length
                      : 2,
                  (index) => Image.file(
                    File(state
                        .businessVerification.panCardDetailsList[index].path),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width /
                        (state.businessVerification.panCardDetailsList.length <=
                                2
                            ? state
                                .businessVerification.panCardDetailsList.length
                            : 2) *
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
      },
    );
  }
}
