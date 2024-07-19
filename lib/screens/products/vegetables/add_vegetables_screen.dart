import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/products/vegetables/all_vegetables/all_vegetables_bloc.dart';
import '../../../widgets/common/loading_view.dart';
import '../../../utils/utils.dart';
import '../../../bloc/products/vegetables/add_vegetables/add_vegetables_bloc.dart';
import '../../../widgets/products/vegetables/vegetable_info.dart';
import '../../../widgets/common/product_availability_info.dart';
import '../../../widgets/products/vegetables/add_product_details_sheet.dart';

class AddVegetablesScreen extends StatelessWidget {
  final Map<String, String> productData;

  const AddVegetablesScreen({
    super.key,
    required this.productData,
  });

  void _tapHandler(BuildContext context) {
    showModalBottomSheet<void>(
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      clipBehavior: Clip.hardEdge,
      enableDrag: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return const AddProductDetailsSheet();
      },
    );
  }

  void _addProductHandler(BuildContext context) {
    final currentVegetable = context.read<AddVegetablesBloc>().state;

    if (currentVegetable.price.isEmpty || currentVegetable.units.isEmpty) {
      showSnackBar(
          "Please add the required details for the selected vegetable.");
    } else {
      context
          .read<AddVegetablesBloc>()
          .add(AddVegetableEvent(vegetableName: productData["name"]!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => _tapHandler(context),
            child: const Icon(Icons.edit),
          ),
          appBar: AppBar(),
          bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                  onPressed: () => _addProductHandler(context),
                  child: const Text("Add product"))),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VegetableInfo(
                    image: productData["image"]!,
                    name: productData["name"]!,
                  ),
                  const SizedBox(height: 20),
                  const ProductAvailabilityInfo(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        BlocConsumer<AddVegetablesBloc, AddVegetablesState>(
          buildWhen: (previous, current) {
            return current is AddVegetablesLoadingState;
          },
          listenWhen: (previous, current) =>
              current is AddVegetablesSuccessState,
          listener: (context, state) {
            if (state is AddVegetablesSuccessState) {
              showSnackBar("Vegetable successfully added");
              context.read<AllVegetablesBloc>().add(AllVegetablesLoad());
              context.pop();
            }
          },
          builder: (context, state) {
            if (state is AddVegetablesLoadingState) {
              return const LoadingView();
            } else {
              return const SizedBox.shrink();
            }
          },
        )
      ],
    );
  }
}
