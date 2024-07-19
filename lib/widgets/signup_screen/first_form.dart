import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/authentication/signup/signup_bloc.dart';
import 'package:social/services/auth/auth_validators.dart';

class FirstForm extends StatefulWidget {
  final Function(int) basicDetailsNext;

  const FirstForm({
    super.key,
    required this.basicDetailsNext,
  });

  @override
  State<FirstForm> createState() => _FirstFormState();
}

class _FirstFormState extends State<FirstForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _businessNameController;
  late final TextEditingController _ownerNameController;
  late final TextEditingController _mobileNumberController;
  late final TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _businessNameController = TextEditingController();
    _ownerNameController = TextEditingController();
    _mobileNumberController = TextEditingController();
    _usernameController = TextEditingController();
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _ownerNameController.dispose();
    _mobileNumberController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _nextHandler() {
    if (_formKey.currentState!.validate()) {
      context.read<SignupBloc>().add(
            SignupSubmitFirstFormEvent(
              businessName: _businessNameController.text,
              mobileNumber: _mobileNumberController.text,
              ownerName: _ownerNameController.text,
              username: _usernameController.text,
            ),
          );
      widget.basicDetailsNext(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            controller: _businessNameController,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: "Business name",
              prefixIcon: Icon(Icons.business),
              helperText: "Registered business name",
            ),
            validator: (value) => AuthValidators.businessName(value),
          ),
          const SizedBox(height: 15),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: _ownerNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: "Owner name",
              prefixIcon: Icon(Icons.person_2_outlined),
              helperText: "Full name of business owner",
            ),
            validator: (value) => AuthValidators.businessOwnerName(value),
          ),
          const SizedBox(height: 15),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: _mobileNumberController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Mobile number (Business)",
              prefixIcon: Icon(Icons.phone_outlined),
              helperText: "Visible to customers & OTP verification",
            ),
            validator: (value) => AuthValidators.mobileNumber(value),
          ),
          const SizedBox(height: 15),
          TextFormField(
            textInputAction: TextInputAction.done,
            controller: _usernameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: "Username",
              prefixIcon: Icon(Icons.alternate_email_outlined),
              helperText: "Must be unique",
            ),
            validator: (value) => AuthValidators.username(value),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.1,
            child: ElevatedButton(
              onPressed: _nextHandler,
              child: const Text("Next"),
            ),
          ),
        ],
      ),
    );
  }
}
