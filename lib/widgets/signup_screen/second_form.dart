import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/authentication/signup/signup_bloc.dart';
import '../../services/auth/auth_validators.dart';

class SecondForm extends StatefulWidget {
  final Function(int) previousForm;
  final Function(int) nextForm;
  const SecondForm({
    super.key,
    required this.previousForm,
    required this.nextForm,
  });

  @override
  State<SecondForm> createState() => _SecondFormState();
}

class _SecondFormState extends State<SecondForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _stateNameController;
  late final TextEditingController _cityNumberController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _stateNameController = TextEditingController();
    _cityNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _stateNameController.dispose();
    _cityNumberController.dispose();
    super.dispose();
  }

  void _nextHandler() {
    if (_formKey.currentState!.validate()) {
      context.read<SignupBloc>().add(SignupSubmitSecondFormEvent(
            email: _emailController.text,
            stateName: _stateNameController.text,
            cityName: _cityNumberController.text,
          ));
      widget.nextForm(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => AuthValidators.emailID(value),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: "Email",
              prefixIcon: Icon(Icons.email_outlined),
              helperText: "Email of your business",
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _stateNameController,
            keyboardType: TextInputType.text,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => AuthValidators.stateName(value),
            decoration: const InputDecoration(
              labelText: "State name",
              prefixIcon: Icon(Icons.location_on_outlined),
              helperText: "Select the state",
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _cityNumberController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.text,
            validator: (value) => AuthValidators.cityName(value),
            decoration: const InputDecoration(
              labelText: "City name",
              prefixIcon: Icon(Icons.location_on_outlined),
              helperText: "Enter your city name",
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: MediaQuery.of(context).size.width / 2.28,
                child: OutlinedButton(
                  onPressed: () => widget.previousForm(0),
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
