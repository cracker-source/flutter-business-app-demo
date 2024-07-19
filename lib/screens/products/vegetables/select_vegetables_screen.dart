import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/common/custom_sliver_app_bar.dart';
import '../../../bloc/products/vegetables/all_vegetables/all_vegetables_bloc.dart';
import '../../../utils/colors.dart';
import '../../../utils/utils.dart';
import '../../../widgets/common/custom_sliver_subtitle.dart';

class SelectVegetablesScreen extends StatefulWidget {
  const SelectVegetablesScreen({super.key});

  @override
  State<SelectVegetablesScreen> createState() => _SelectVegetablesScreenState();
}

class _SelectVegetablesScreenState extends State<SelectVegetablesScreen> {
  void _tapHandler(
      String productName, String productImage, BuildContext context) {
    context.push("/products/vegetables/select-vegetables/add", extra: {
      "name": productName,
      "image": productImage,
    });
  }

  Widget _frameBuilderHandler(context, child, frame, wasSynchronouslyLoaded) {
    if (wasSynchronouslyLoaded) return child;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: frame != null
          ? child
          : Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.inputFillColor,
              ),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<AllVegetablesBloc>().add(AllVegetablesLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(
            appBarName: "Vegetables",
          ),
          const CustomSliverSubtitle(
            subtitle:
                "Add the vegetables that are currently available in your shop for your customers.",
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          BlocBuilder<AllVegetablesBloc, AllVegetablesState>(
            builder: (context, state) {
              if (state is AllVegetablesLoadingState) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is AllVegetablesLoadedState) {
                final vegetables = state.allVegetables;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: vegetables.length, (context, index) {
                    return ListTile(
                      onTap: () => vegetables[index]["isSelected"] == true
                          ? showSnackBar("Vegetable already added")
                          : _tapHandler(vegetables[index]["name"],
                              vegetables[index]["image"], context),
                      title: Text(vegetables[index]["name"]),
                      leading: Image.network(
                        vegetables[index]["image"],
                        frameBuilder: _frameBuilderHandler,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                      trailing: vegetables[index]["isSelected"] == true
                          ? const Icon(Icons.done, color: Colors.green)
                          : null,
                    );
                  }),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
