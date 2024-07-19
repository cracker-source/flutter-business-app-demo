import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../utils/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SvgPicture.asset("assets/Current location-pana.svg", width: 450),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Grow your business with ",
                  style: Theme.of(context).textTheme.headlineLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: "AppName ",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    const TextSpan(text: "now")
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: ElevatedButton(
                  onPressed: () => context.push('/signup'),
                  child: Text(
                    "Create an account",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: OutlinedButton(
                  onPressed: () => context.push('/login'),
                  child: const Text("Log in"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
