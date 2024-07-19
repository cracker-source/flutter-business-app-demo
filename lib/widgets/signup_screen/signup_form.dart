import 'package:flutter/material.dart';

import 'first_form.dart';
import 'second_form.dart';
import 'third_form.dart';

import 'active_form_indicator.dart';
import 'fourth_form.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  int _currentlyActiveIndex = 0;

  void _handleFormIndicator(int index) {
    setState(() {
      _currentlyActiveIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActiveFormIndicator(currentlyActiveIndex: _currentlyActiveIndex),
        const SizedBox(height: 25),
        IndexedStack(
          index: _currentlyActiveIndex,
          children: [
            Visibility(
              child: FirstForm(
                basicDetailsNext: _handleFormIndicator,
              ),
            ),
            Visibility(
              child: SecondForm(
                previousForm: _handleFormIndicator,
                nextForm: _handleFormIndicator,
              ),
            ),
            Visibility(
              child: ThirdForm(
                previousForm: _handleFormIndicator,
                nextForm: _handleFormIndicator,
              ),
            ),
            Visibility(
              child: FourthForm(
                previousForm: _handleFormIndicator,
                nextForm: _handleFormIndicator,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
