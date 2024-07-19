import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social/bloc/product_category/add_product_category/add_product_category_bloc.dart';

import '../../utils/colors.dart';

class ActionBottomSheet extends StatelessWidget {
  final String categoryName;

  const ActionBottomSheet({super.key, required this.categoryName});

  void _addHandler(BuildContext context) {
    context.read<AddProductCategoryBloc>().add(
          AddProductCategoryAddEvent(
            categoryName: categoryName,
          ),
        );
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      height: 200,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(text: "Add ", style: textStyle, children: [
                  TextSpan(
                    text: categoryName,
                    style: textStyle?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: " to you product category list?",
                    style: textStyle,
                  )
                ]),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: MediaQuery.of(context).size.width / 2.28,
                      child: OutlinedButton(
                        onPressed: () => context.pop(),
                        child: const Text("Cancel"),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.28,
                      child: ElevatedButton(
                        onPressed: () => _addHandler(context),
                        child: const Text("Add"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
