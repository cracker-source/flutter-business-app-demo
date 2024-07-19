import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String appBarName;

  const CustomSliverAppBar({super.key, required this.appBarName});

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(builder: (context, constraints) {
      final scrolled =
          constraints.scrollOffset > MediaQuery.of(context).size.height / 6;
      return SliverAppBar(
        title: AnimatedOpacity(
          opacity: scrolled ? 1 : 0,
          duration: const Duration(milliseconds: 1),
          child: Text(
            appBarName,
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Products",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 10),
                const Text("The categories which are available in your shop"),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        color: AppColors.sliverCardLabelColor,
                        child: const Text(
                          "Total categories",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // title: Text(
          //   appBarName,
          //   style: Theme.of(context).textTheme.titleLarge,
          //   textScaleFactor: scrolled ? 0.85 : 0.8,
          // ),
          // titlePadding: EdgeInsets.only(left: scrolled ? 64 : 16, bottom: 16),
        ),
        shadowColor: Colors.grey.shade50,
        surfaceTintColor: Colors.white,
        pinned: true,
        expandedHeight: MediaQuery.of(context).size.height / 4,
      );
    });
  }
}
