import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product_category/add_product_category/add_product_category_bloc.dart';
import '../../widgets/add_product_category_screen/add_product_category_view.dart';

class AddProductCategoryScreen extends StatefulWidget {
  const AddProductCategoryScreen({super.key});

  @override
  State<AddProductCategoryScreen> createState() =>
      _AddProductCategoryScreenState();
}

class _AddProductCategoryScreenState extends State<AddProductCategoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AddProductCategoryBloc>().add(AddProductCategoryLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductCategoryBloc, AddProductCategoryState>(
      buildWhen: (previous, current) {
        return current is AddProductCategoryLoading ||
            current is AddProductCategoryLoaded;
      },
      builder: (context, state) {
        if (state is AddProductCategoryLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is AddProductCategoryLoaded) {
          return AddProductCategoryView(
            productCategories: state.userProductCategories,
          );
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
