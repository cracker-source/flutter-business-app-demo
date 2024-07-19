import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../utils/colors.dart';
import '../../widgets/common/custom_nested_scroll_view.dart';
import '../../bloc/product_category/product_category/product_category_bloc.dart';
import '../../widgets/product_categories_screen/product_category_info.dart';
import '../../utils/utils.dart';
import '../../widgets/product_categories_screen/product_categories.dart';
import 'product_categories_sort_filter_sheet.dart';

class ProductCategoriesScreen extends StatefulWidget {
  const ProductCategoriesScreen({super.key});

  @override
  State<ProductCategoriesScreen> createState() =>
      _ProductCategoriesScreenState();
}

class _ProductCategoriesScreenState extends State<ProductCategoriesScreen> {
  @override
  void initState() {
    context.read<ProductCategoryBloc>().add(ProductCategoryLoadEvent());
    super.initState();
  }

  void _sortAndFilterHandler() {
    bottomSheetHandler(const ProductCategoriesSortFilterSheet(), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            onPressed: _sortAndFilterHandler,
            backgroundColor: AppColors.inputFillColor,
            tooltip: "Sort & Filter",
            child: Icon(
              Icons.filter_alt_outlined,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: null,
            onPressed: () => context.push("/product-categories/add"),
            child: const Icon(Icons.add),
          )
        ],
      ),
      body: BlocConsumer<ProductCategoryBloc, ProductCategoryState>(
        listener: (context, state) {
          if (state is ProductCategoryErrorState) {
            showSnackBar("Something went wrong! please try again.");
          }
        },
        builder: (context, state) {
          if (state is ProductCategoryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductCategoryLoadedState) {
            final categories = state.productCategories;
            return CustomNestedScrollView(
              infoWidget: const ProductCategoryInfo(),
              headerImage: state.headerImage,
              widget: ProductCategories(categories: categories),
              appbarName: "Product categories",
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
