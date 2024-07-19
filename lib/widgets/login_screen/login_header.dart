import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class LoginHeader extends StatelessWidget {
  final String headerName;
  const LoginHeader({super.key, required this.headerName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.shop_2,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            textAlign: TextAlign.center,
            headerName,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
