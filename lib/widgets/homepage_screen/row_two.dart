import 'package:flutter/material.dart';

import 'icon_column.dart';

class RowTwo extends StatelessWidget {
  const RowTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            IconColumn(
              icon: Icons.timer_sharp,
              title: "Timings",
              tapHandler: () {},
            ),
            IconColumn(
              icon: Icons.insights_outlined,
              title: "Promote",
              tapHandler: () {},
            ),
            IconColumn(
              icon: Icons.location_on_outlined,
              title: "Location",
              tapHandler: () {},
            ),
            IconColumn(
              icon: Icons.reviews_outlined,
              title: "Reviews",
              tapHandler: () {},
            ),
          ],
        ),
      ],
    );
  }
}
