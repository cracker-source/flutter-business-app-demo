import 'package:flutter/material.dart';

class CustomSliverSubtitle extends StatelessWidget {
  final String subtitle;

  const CustomSliverSubtitle({
    super.key,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        child: Text(
          subtitle,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
