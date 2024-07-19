import 'package:flutter/material.dart';

import '../../widgets/signup_verification_screen/signup_verification_details.dart';
import '../../widgets/signup_verification_screen/verification_info.dart';

class SignupVerificationScreen extends StatelessWidget {
  const SignupVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text("Verification",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                  "Please submit the required details while you are at your shop location. Your account will get verified within 24 hours."),
            ),
            const SizedBox(height: 20),
            const SignupVerificationDetails(),
            const Expanded(child: SizedBox.shrink()),
            const VerificationInfo(),
            const Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
