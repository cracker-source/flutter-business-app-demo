import 'package:flutter/material.dart';

class IconRowInfo extends StatelessWidget {
  final String text;
  final IconData icon;

  const IconRowInfo({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.black,
              ),
        )
      ],
    );
  }
}
