import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/colors.dart';
import '../../bloc/product_category/add_product_category/add_product_category_bloc.dart';
import '../../utils/utils.dart';
import '../../widgets/common/loading_view.dart';
import '../common/custom_sliver_app_bar.dart';
import 'action_bottom_sheet.dart';

class AddProductCategoryView extends StatelessWidget {
  final List<dynamic> productCategories;

  const AddProductCategoryView({super.key, required this.productCategories});

  void _tapHandler(String categoryName, BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return ActionBottomSheet(
          categoryName: categoryName,
        );
      },
    );
  }

  Widget _frameBuilderHandler(context, child, frame, wasSynchronouslyLoaded) {
    if (wasSynchronouslyLoaded) return child;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: frame != null
          ? child
          : Container(
              color: AppColors.inputFillColor,
              height: 40,
              width: 40,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: CustomScrollView(
            slivers: [
              const CustomSliverAppBar(appBarName: "Add Product Category"),
              // const CustomSliverSubtitle(
              //   subtitle:
              //       "Add the product categroy based on the items or products that are available in your shop.",
              // ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    childCount: productCategories.length, (context, index) {
                  return ListTile(
                    onTap: () => productCategories[index]["isSelected"] == true
                        ? showSnackBar("Product category already added")
                        : _tapHandler(
                            productCategories[index]["name"], context),
                    title: Text(productCategories[index]["name"]),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        productCategories[index]["image"],
                        frameBuilder: _frameBuilderHandler,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    trailing: productCategories[index]["isSelected"] == true
                        ? const Icon(Icons.done, color: Colors.green)
                        : null,
                  );
                }),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
            ],
          ),
        ),
        BlocConsumer<AddProductCategoryBloc, AddProductCategoryState>(
          buildWhen: (previous, current) {
            return current is AddProductCategoryAdding;
          },
          listener: (context, state) {
            if (state is AddProductCategoryAdded) {
              context
                  .read<AddProductCategoryBloc>()
                  .add(AddProductCategoryLoadEvent());
              showSnackBar("Product category successfully added!");
            } else if (state is AddProductCategoryAddingError) {
              showSnackBar("Something went wrong, please try again!");
            }
          },
          builder: (context, state) {
            if (state is AddProductCategoryAdding) {
              return const LoadingView();
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}
