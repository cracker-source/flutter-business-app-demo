// import 'package:flutter/material.dart';
// import 'package:social/widgets/homepage_screen/product_category.dart';

// class AvailableItems extends StatefulWidget {
//   const AvailableItems({super.key});

//   @override
//   State<AvailableItems> createState() => _AvailableItemsState();
// }

// class _AvailableItemsState extends State<AvailableItems> {
//   int _selectedIndex = 0;

//   final RoundedRectangleBorder _chipBorder = RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(50),
//   );

//   void _chipsHandler(bool value, int i) {
//     setState(() {
//       _selectedIndex = i;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               FilterChip(
//                 shape: _chipBorder,
//                 label: const Text("Products"),
//                 selected: _selectedIndex == 0,
//                 onSelected: (i) => _chipsHandler(i, 0),
//                 labelStyle: TextStyle(
//                   color: _selectedIndex == 0 ? Colors.white : Colors.black,
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 10),
//                 child: FilterChip(
//                   shape: _chipBorder,
//                   label: const Text("Services"),
//                   selected: _selectedIndex == 1,
//                   onSelected: (i) => _chipsHandler(i, 1),
//                   labelStyle: TextStyle(
//                     color: _selectedIndex == 1 ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         IndexedStack(
//           index: _selectedIndex,
//           children: [
//             Visibility(
//               maintainState: false,
//               visible: _selectedIndex == 0,
//               child: ProductsGrid(),
//             ),
//             Visibility(
//               maintainState: false,
//               visible: _selectedIndex == 1,
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 padding: const EdgeInsets.all(16),
//                 itemCount: 10,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                 ),
//                 itemBuilder: (_, int index) {
//                   return SizedBox(
//                     child: Card(
//                       child: Text("Services, $index"),
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }
