import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'icon_column.dart';

class RowOne extends StatelessWidget {
  const RowOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            IconColumn(
              icon: Icons.inventory_2_outlined,
              title: "Products",
              tapHandler: () => context.push("/product-categories"),
            ),
            IconColumn(
              icon: Icons.support_agent_outlined,
              title: "Services",
              tapHandler: () {},
            ),
            IconColumn(
              icon: Icons.work_outline_outlined,
              title: "Jobs",
              tapHandler: () {},
            ),
            IconColumn(
              icon: Icons.sell_outlined,
              title: "Offers",
              tapHandler: () {},
            ),
          ],
        ),
      ],
    );
  }
}
