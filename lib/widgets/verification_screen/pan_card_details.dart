import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social/bloc/verification/business_verification/business_verification_bloc.dart';
import 'package:social/services/auth/auth_validators.dart';

import '../../utils/utils.dart';
import 'pan_card_images_container.dart';

class PanCardDetails extends StatelessWidget {
  final TextEditingController pancardController;
  final GlobalKey<FormState> formKey;

  const PanCardDetails({
    super.key,
    required this.formKey,
    required this.pancardController,
  });

  void panCardDetailsImages(BuildContext context) async {
    final response = await pickMultipleImages();

    if (response.isNotEmpty && context.mounted) {
      context.read<BusinessVerificationBloc>().add(
          BusinessVerificationPancardPhotosEvent(panCardDetailsList: response));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pan Card Details",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 15),
        const PanCardImagesContainer(),
        const SizedBox(height: 15),
        Text(
          "Submit a photo of your pan card for verification along with a pic of the owner (if possible).",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          child: OutlinedButton(
              onPressed: () => panCardDetailsImages(context),
              child: const Text("Add pics")),
        ),
        const SizedBox(height: 15),
        Form(
          key: formKey,
          child: TextFormField(
            controller: pancardController,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            textInputAction: TextInputAction.done,
            validator: (value) => AuthValidators.pancardValidator(value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: "Enter your pan card number",
              prefixIcon: Icon(Icons.payment),
            ),
          ),
        )
      ],
    );
  }
}
