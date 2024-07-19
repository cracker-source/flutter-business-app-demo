import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/select_category_screen/select_category_view.dart';
import '../bloc/verification/basic_verification/verification_bloc.dart';
import '../utils/business_categories.dart';
import '../widgets/common/loading_view.dart';

class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({super.key});

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  int? selectedRadio;

  void _selectCategoryHandler(int? val) {
    setState(
      () {
        selectedRadio = val;
      },
    );
  }

  void _addCategory() {
    if (selectedRadio == null) {
      showSnackBar("Please select a business category");
    } else {
      context.read<VerificationBloc>().add(
            VerificationDetailsAddCategoryEvent(
              categoryName:
                  categoryValues[selectedRadio ?? 0]["value"].toString(),
            ),
          );
    }
  }

  final BoxDecoration _boxDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        offset: const Offset(0, 1),
        blurRadius: 4,
        color: Colors.black.withOpacity(0.3),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 65,
            decoration: _boxDecoration,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith(
                        (states) => AppColors.primaryColor,
                      ),
                    ),
                    onPressed: _addCategory,
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
          body: SelectCategoryView(
            selectedRadio: selectedRadio,
            selectCategoryHandler: (int? value) =>
                _selectCategoryHandler(value),
          ),
        ),
        BlocConsumer<VerificationBloc, VerificationState>(
          listener: (context, state) {
            if (state is VerificationCategorySuccessState) {
              showSnackBar("Submitted successfully");
              context
                  .read<VerificationBloc>()
                  .add(const VerificationDetailsLoadEvent());
              context.go("/authorization");
            }
          },
          builder: (context, state) {
            if (state is VerificationCategoryLoadingState) {
              return const LoadingView();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
