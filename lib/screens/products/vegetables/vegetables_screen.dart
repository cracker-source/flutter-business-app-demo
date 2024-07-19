import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social/widgets/products/vegetables/vegetable_list_card.dart';

import '../../../bloc/products/vegetables/user_veetables/user_vegetables_bloc.dart';
import '../../../widgets/common/custom_nested_scroll_view.dart';
import '../../../widgets/common/custom_sliver_subtitle.dart';

class VegetablesScreen extends StatefulWidget {
  final Map<String, String> vegetableData;

  const VegetablesScreen({
    super.key,
    required this.vegetableData,
  });

  @override
  State<VegetablesScreen> createState() => _VegetablesScreenState();
}

class _VegetablesScreenState extends State<VegetablesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserVegetablesBloc>().add(UserVegetablesLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/products/vegetables/select-vegetables'),
        child: const Icon(Icons.add),
      ),
      body: CustomNestedScrollView(
        infoWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSliverSubtitle(
              subtitle: "The categories that are available in your shop.",
            ),
            Wrap(
              spacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.green,
                    child: const Text(
                      "In stock - 8",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    color: Colors.orange.shade800,
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      "Few left - 8",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.red,
                    child: const Text(
                      "Out of stock - 8",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                child: Text(
                  "13 categories available in total.",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),
        headerImage: widget.vegetableData["image"]!,
        appbarName: "Vegetables",
        widget: BlocBuilder<UserVegetablesBloc, UserVegetablesState>(
          builder: (context, state) {
            if (state is UserVegetablesLoadedState) {
              final userVegetables = state.userVegetables;
              return ListView.builder(
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return VegetableListCard(
                    vegetableName: userVegetables[index]["vegetableId"]
                        ["vegetableName"],
                    vegetableImage: userVegetables[index]["vegetableId"]
                        ["vegetableImage"],
                    status: userVegetables[index]["status"],
                    units: userVegetables[index]["units"],
                    price: userVegetables[index]["price"]["\$numberDecimal"],
                  );
                },
                itemCount: userVegetables.length,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
