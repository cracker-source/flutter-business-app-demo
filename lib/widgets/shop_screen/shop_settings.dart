import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social/widgets/shop_screen/icon_row_title.dart';

class ShopSettings extends StatelessWidget {
  const ShopSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Material(
        child: Container(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const IconRowTitle(
                        text: "Settings", icon: Icons.settings_outlined),
                    const SizedBox(height: 10),
                    Text(
                      "Manage your subscriptions and verifications",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                leading:
                    const Icon(Icons.gpp_good_outlined, color: Colors.black),
                title: const Text("Subscription"),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              ListTile(
                onTap: () => context.push("/edit-shop"),
                leading: const Icon(Icons.edit_outlined, color: Colors.black),
                title: const Text("Edit Shop"),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Colors.black, size: 20),
              ),
              ListTile(
                onTap: () {},
                title: const Text("Verification"),
                leading:
                    const Icon(Icons.verified_outlined, color: Colors.black),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Colors.black, size: 20),
              ),
              ListTile(
                onTap: () {},
                title: const Text("Logout"),
                leading: const Icon(Icons.logout_outlined, color: Colors.black),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Colors.black, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
