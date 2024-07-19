import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:social/utils/colors.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          // key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Verification",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 15),
              Text(
                textAlign: TextAlign.center,
                "Enter the code sent to the number",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 15),
              Text(
                textAlign: TextAlign.center,
                "+91 8790482974",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 50),
              Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  // controller: pinController,
                  // focusNode: focusNode,
                  // androidSmsAutofillMethod:
                  // AndroidSmsAutofillMethod.smsUserConsentApi,
                  // listenForMultipleSmsOnAndroid: true,
                  // defaultPinTheme: defaultPinTheme,
                  validator: (value) {
                    return value == '2222' ? null : 'Pin is incorrect';
                  },
                  // onClipboardFound: (value) {
                  //   debugPrint('onClipboardFound: $value');
                  //   pinController.setText(value);
                  // },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        // color: focusedBorderColor,
                      ),
                    ],
                  ),
                  // focusedPinTheme: defaultPinTheme.copyWith(
                  //   decoration: defaultPinTheme.decoration!.copyWith(
                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(color: focusedBorderColor),
                  //   ),
                  // ),
                  // submittedPinTheme: defaultPinTheme.copyWith(
                  //   decoration: defaultPinTheme.decoration!.copyWith(
                  //     color: fillColor,
                  //     borderRadius: BorderRadius.circular(19),
                  //     border: Border.all(color: focusedBorderColor),
                  //   ),
                  // ),
                  // errorPinTheme: defaultPinTheme.copyBorderWith(
                  //   border: Border.all(color: Colors.redAccent),
                  // ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Didn't recived the code?",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Resend",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: ElevatedButton(
                  onPressed: () {
                    // focusNode.unfocus();
                    // formKey.currentState!.validate();
                  },
                  child: const Text('Confirm'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
