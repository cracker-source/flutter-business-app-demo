import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/authentication/signup/signup_bloc.dart';
import 'package:social/services/auth/auth_validators.dart';

class ThirdForm extends StatefulWidget {
  final Function(int) previousForm;
  final Function(int) nextForm;

  const ThirdForm({
    super.key,
    required this.previousForm,
    required this.nextForm,
  });

  @override
  State<ThirdForm> createState() => _ThirdFormState();
}

class _ThirdFormState extends State<ThirdForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _pincodeController;
  late final TextEditingController _districtNameController;
  late final TextEditingController _addressLaneOneController;

  @override
  void initState() {
    super.initState();
    _pincodeController = TextEditingController();
    _districtNameController = TextEditingController();
    _addressLaneOneController = TextEditingController();
  }

  @override
  void dispose() {
    _pincodeController.dispose();
    _districtNameController.dispose();
    _addressLaneOneController.dispose();
    super.dispose();
  }

  void _nextHandler() {
    if (_formKey.currentState!.validate()) {
      context.read<SignupBloc>().add(SignupSubmitThirdFormEvent(
            pincode: _pincodeController.text,
            districtName: _districtNameController.text,
            addressLaneOne: _addressLaneOneController.text,
          ));
      widget.nextForm(3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _pincodeController,
            keyboardType: TextInputType.number,
            validator: (value) => AuthValidators.pincode(value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: "Pincode",
              prefixIcon: Icon(Icons.location_on_outlined),
              helperText: "Enter your pincode",
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _districtNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => AuthValidators.districtName(value),
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: "District name",
              prefixIcon: Icon(Icons.location_on_outlined),
              helperText: "Enter your district name",
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _addressLaneOneController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => AuthValidators.addressLaneOne(value),
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: "Road name, Area, Colony",
              prefixIcon: Icon(Icons.location_on_outlined),
              helperText: "Location of your business",
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: MediaQuery.of(context).size.width / 2.28,
                child: OutlinedButton(
                  onPressed: () => widget.previousForm(1),
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
