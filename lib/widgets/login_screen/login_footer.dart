import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Forgot password?",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.primaryColor,
                ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: RichText(
            text: TextSpan(
              text: "Don't have an account? ",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.black),
              children: [
                TextSpan(
                  text: "Sign up",
                  style: TextStyle(color: AppColors.primaryColor),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
