import 'package:flutter/material.dart';

class EditShop extends StatelessWidget {
  final String appBarName;
  final String inputName;
  final Function saveHandler;
  final IconData inputIcon;

  const EditShop({
    super.key,
    required this.appBarName,
    required this.inputName,
    required this.saveHandler,
    required this.inputIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: inputName,
                prefixIcon: Icon(inputIcon),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => saveHandler,
                child: const Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
