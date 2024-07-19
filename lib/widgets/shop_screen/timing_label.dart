import 'package:flutter/material.dart';

class TimingLabel extends StatelessWidget {
  final String timing;
  final String weekLabel;
  TimingLabel({super.key, required this.timing, required this.weekLabel});

  final Widget _indicator = Container(
    width: 5,
    height: 5,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.green,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Row(
              children: [
                _indicator,
                const SizedBox(width: 10),
                Text(weekLabel)
              ],
            ),
            Text(timing)
          ],
        )
      ],
    );
  }
}
