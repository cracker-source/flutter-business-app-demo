import 'package:flutter/material.dart';

class ShopHeader extends StatelessWidget {
  ShopHeader({super.key});

  final List<Color> _linearGradientColors = [
    Colors.transparent,
    Colors.black12,
    Colors.black87,
    Colors.black87,
  ];

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints) {
        final scrolled =
            constraints.scrollOffset > MediaQuery.of(context).size.height / 3.5;
        return SliverAppBar(
          backgroundColor: Colors.white,
          pinned: true,
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
          expandedHeight: MediaQuery.of(context).size.height / 2.5,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding:
                const EdgeInsets.only(left: 16, bottom: 12, right: 40),
            title: Text(
              "Vinayaka Fast Food & Restaurant",
              textScaleFactor: scrolled ? 0.85 : 0.9,
              overflow: scrolled ? TextOverflow.ellipsis : TextOverflow.clip,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: scrolled ? Colors.black : Colors.white,
                    fontWeight: scrolled ? FontWeight.normal : FontWeight.bold,
                  ),
            ),
            background: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/vegetables.jpg"),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.2, 0.5, 0.9, 0.6],
                    colors: _linearGradientColors,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
