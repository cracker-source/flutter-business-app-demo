import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool _clearIconVisible = false;
  bool _isPasswordVisible = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: _emailController,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_outlined),
              suffixIcon: _clearIconVisible
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _emailController.clear();
                        setState(() {
                          _clearIconVisible = false;
                        });
                      },
                    )
                  : null,
              labelText: "Email",
            ),
            onChanged: (value) {
              if (value.isEmpty) {
                setState(() {
                  _clearIconVisible = false;
                });
              } else {
                setState(() {
                  _clearIconVisible = true;
                });
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty || !value.contains("@")) {
                return "Enter valid email";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _passwordController,
            obscureText: _isPasswordVisible,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter password";
              }
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                onPressed: () => setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                }),
                icon: Icon(
                  _isPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              labelText: "Password",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Text(
                "Log in",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
