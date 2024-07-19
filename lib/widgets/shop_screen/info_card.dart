import 'package:flutter/material.dart';

import 'icon_row_title.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final Widget widget;
  final String infoCardName;

  const InfoCard({
    super.key,
    required this.widget,
    required this.infoCardName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconRowTitle(
            icon: icon,
            text: infoCardName,
          ),
          widget,
        ],
      ),
    );
  }
}
