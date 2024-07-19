import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product_category/product_category/product_category_bloc.dart';

class ProductCategoriesSortFilterSheet extends StatefulWidget {
  const ProductCategoriesSortFilterSheet({super.key});

  @override
  State<ProductCategoriesSortFilterSheet> createState() =>
      _ProductCategoriesSortFilterSheetState();
}

class _ProductCategoriesSortFilterSheetState
    extends State<ProductCategoriesSortFilterSheet> {
  void _sortHandler(String sort) {
    context.read<ProductCategoryBloc>().add(
          ProductCategorySortEvent(sortingName: sort),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      height: 230,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sort by",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          ListTile(
            onTap: () => _sortHandler("Date"),
            title: const Text("Date"),
          ),
          ListTile(
            onTap: () => _sortHandler("Title"),
            title: const Text("Title"),
          ),
          ListTile(
            onTap: () => _sortHandler("Item count"),
            title: const Text("Item count"),
          ),
        ],
      ),
    );
  }
}



// Wrap(
//             spacing: 5,
//             children: [
//               FilterChip(
//                 selected: _selectedFilter == "Offers",
//                 label: const Text("Offers"),
//                 onSelected: (value) => _selectedUnitsHandler("Offers"),
//               ),
//               FilterChip(
//                 selected: _selectedFilter == "Delivery",
//                 label: const Text("Delivery"),
//                 onSelected: (value) => _selectedUnitsHandler("Delivery"),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),
//           Text(
//             "Sort by",
//             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//           ),
//           const SizedBox(height: 5),
//           Wrap(
//             spacing: 5,
//             children: [
//               FilterChip(
//                 selected: _selectedFilter == "Recently added",
//                 label: const Text("Recently added"),
//                 onSelected: (value) => _selectedUnitsHandler("Recently added"),
//               ),
//               FilterChip(
//                 selected: _selectedFilter == "Title",
//                 label: const Text("Title"),
//                 onSelected: (value) => _selectedUnitsHandler("Title"),
//               ),
//               FilterChip(
//                 selected: _selectedFilter == "Items count",
//                 label: const Text("Items count"),
//                 onSelected: (value) => _selectedUnitsHandler("Items count"),
//               ),
//             ],
//           ),
//           const Expanded(child: SizedBox.shrink()),
//           SizedBox(
//             width: MediaQuery.of(context).size.width / 1.1,
//             child: Row(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(right: 10),
//                   width: MediaQuery.of(context).size.width / 2.28,
//                   child: OutlinedButton(
//                     onPressed: () {},
//                     child: const Text("Clear"),
//                   ),
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width / 2.28,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text("Apply"),
//                   ),
//                 ),
//               ],
//             ),
//           )
