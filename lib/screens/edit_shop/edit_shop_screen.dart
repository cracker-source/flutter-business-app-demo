
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditShopScreen extends StatelessWidget {
  EditShopScreen({super.key});

  final List<Map<String, dynamic>> _settings = [
    {
      "title": "Business name",
      "icon": Icons.business_center_outlined,
      "link": "/edit-shop/business-name",
    },
    {
      "title": "Category",
      "icon": Icons.category_outlined,
      "link": "/select-category",
    },
    {
      "title": "Owner name",
      "icon": Icons.person_2_outlined,
      "link": "/edit-shop/owner-name",
    },
    {
      "title": "Business number",
      "icon": Icons.phone_outlined,
      "link": "/edit-shop/business-number",
    },
    {
      "title": "Email",
      "icon": Icons.email_outlined,
      "link": "/edit-shop/business-email",
    },
    {
      "title": "Precautions",
      "icon": Icons.list_alt,
      "link": "business-name",
    },
    {
      "title": "Available payments",
      "icon": Icons.payment_outlined,
      "link": "business-name",
    },
    {
      "title": "Timings",
      "icon": Icons.access_time,
      "link": "business-name",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Shop"),
      ),
      body: ListView.builder(
        itemCount: _settings.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(_settings[index]['icon'], color: Colors.black),
            title: Text(_settings[index]['title']),
            trailing: const Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.black),
            onTap: () => context.push(_settings[index]['link']),
          );
        },
      ),
    );
  }
}
