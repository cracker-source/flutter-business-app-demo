import 'package:flutter/material.dart';

class IconInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const IconInfo({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 30,
        ),
        Text(text, style: Theme.of(context).textTheme.bodySmall)
      ],
    );
  }
}
