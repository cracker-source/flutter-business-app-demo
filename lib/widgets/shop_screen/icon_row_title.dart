import 'package:flutter/material.dart';

class IconRowTitle extends StatelessWidget {
  final String text;
  final IconData icon;

  const IconRowTitle({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
