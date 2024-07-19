import 'package:flutter/material.dart';
import 'package:social/widgets/shop_screen/timing_label.dart';

class ShopTimings extends StatelessWidget {
  const ShopTimings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          "Daily opening and closing time of your business",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 20),
        TimingLabel(timing: "9 a.m to 10 p.m", weekLabel: "Mon"),
        const SizedBox(height: 10),
        TimingLabel(timing: "9 a.m to 10 p.m", weekLabel: "Tue"),
        const SizedBox(height: 10),
        TimingLabel(timing: "9 a.m to 10 p.m", weekLabel: "Wed"),
        const SizedBox(height: 10),
        TimingLabel(timing: "9 a.m to 10 p.m", weekLabel: "Thurs"),
        const SizedBox(height: 10),
        TimingLabel(timing: "9 a.m to 10 p.m", weekLabel: "Fri"),
        const SizedBox(height: 10),
        TimingLabel(timing: "9 a.m to 10 p.m", weekLabel: "Sat"),
        const SizedBox(height: 10),
        TimingLabel(timing: "9 a.m to 10 p.m", weekLabel: "Sun"),
      ],
    );
  }
}
