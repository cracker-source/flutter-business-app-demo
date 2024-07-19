import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/authentication/signup/signup_bloc.dart';
import 'package:social/services/auth/auth_validators.dart';
import 'package:social/utils/utils.dart';

class FourthForm extends StatefulWidget {
  final Function(int) previousForm;
  final Function(int) nextForm;

  const FourthForm({
    super.key,
    required this.previousForm,
    required this.nextForm,
  });

  @override
  State<FourthForm> createState() => _FourthFormState();
}

class _FourthFormState extends State<FourthForm> {
  bool? _isPrivacyPolicyAccepted = false;

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _addressLaneTwoController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _addressLaneTwoController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _addressLaneTwoController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _nextHandler() {
    if (_formKey.currentState!.validate()) {
      if (_isPrivacyPolicyAccepted == false) {
        showSnackBar("Please accept Privacy Policy & Terms and conditions.");
      } else {
        context.read<SignupBloc>().add(
              SignupRequestedEvent(
                addressLaneTwo: _addressLaneTwoController.text,
                password: _passwordController.text,
                confirmPassword: _confirmPasswordController.text,
                context: context,
              ),
            );
      }
    }
  }

  void _privacyPolicyHandler(bool? val) {
    setState(() {
      _isPrivacyPolicyAccepted = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _addressLaneTwoController,
            validator: (value) => AuthValidators.addressLaneTwo(value),
            keyboardType: TextInputType.streetAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: "House.no, Building name",
              prefixIcon: Icon(Icons.location_on_outlined),
              helperText: "Location of your business",
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => AuthValidators.password(value),
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: "Password",
              prefixIcon: Icon(Icons.lock_outline),
              helperText: "Min 7 characters (alpha-numeric)",
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) =>
                AuthValidators.confirmPassword(value, _passwordController.text),
            decoration: const InputDecoration(
              labelText: "Confirm password",
              prefixIcon: Icon(Icons.lock_outline),
              helperText: "Should match above password",
            ),
          ),
          const SizedBox(height: 15),
          CheckboxListTile(
            value: _isPrivacyPolicyAccepted,
            onChanged: _privacyPolicyHandler,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              "Accept privacy policy & Terms and conditions",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: MediaQuery.of(context).size.width / 2.28,
                child: OutlinedButton(
                  onPressed: () => widget.previousForm(2),
                  child: const Text("Previous"),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.28,
                child: ElevatedButton(
                  onPressed: _nextHandler,
                  child: const Text("Next"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// () => context.pushReplacement("/signup/profile")
