import 'package:flutter/material.dart';

import '../../utils/business_categories.dart';
import '../../utils/colors.dart';

class SelectCategoryView extends StatefulWidget {
  final int? selectedRadio;
  final Function(int?) selectCategoryHandler;

  const SelectCategoryView({
    super.key,
    required this.selectedRadio,
    required this.selectCategoryHandler,
  });

  @override
  State<SelectCategoryView> createState() => _SelectCategoryViewState();
}

class _SelectCategoryViewState extends State<SelectCategoryView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverLayoutBuilder(builder: (context, constraints) {
          final scrolled = constraints.scrollOffset >
              MediaQuery.of(context).size.height / 14.5;
          return SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Select Category",
                style: Theme.of(context).textTheme.titleLarge,
                textScaleFactor: scrolled ? 0.85 : 0.8,
              ),
              titlePadding:
                  EdgeInsets.only(left: scrolled ? 64 : 16, bottom: 16),
            ),
            shadowColor: Colors.grey.shade50,
            surfaceTintColor: Colors.white,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height / 6,
          );
        }),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 40,
              child: Text(
                "Select the business categroy based on the items or products that are available to your customers.",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: categoryValues.length,
              (context, index) {
                return RadioListTile(
                  value: index,
                  groupValue: widget.selectedRadio,
                  controlAffinity: ListTileControlAffinity.trailing,
                  selected: widget.selectedRadio == index,
                  activeColor: AppColors.primaryColor,
                  toggleable: true,
                  title: Text(categoryValues[index]["value"].toString()),
                  onChanged: widget.selectCategoryHandler,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
