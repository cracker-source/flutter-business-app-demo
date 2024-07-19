import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

import '../../../bloc/products/vegetables/add_vegetables/add_vegetables_bloc.dart';

class AddProductDetailsSheet extends StatefulWidget {
  const AddProductDetailsSheet({super.key});

  @override
  State<AddProductDetailsSheet> createState() => _AddProductDetailsSheetState();
}

class _AddProductDetailsSheetState extends State<AddProductDetailsSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _productPriceController;
  late final CurrencyTextInputFormatter _formatter;
  String _selectedUnit = "1 Kg";

  @override
  void initState() {
    super.initState();
    _productPriceController = TextEditingController();
    // _formatter = CurrencyTextInputFormatter(
    //   // locale: 'hi',
    //   // decimalDigits: 0,
    //   // symbol: '',

    // );
  }

  @override
  void dispose() {
    super.dispose();
    _productPriceController.dispose();
  }

  void _selectedUnitsHandler(String unit) {
    setState(() {
      _selectedUnit = unit;
    });
  }

  String? _priceValidationHandler(String? value) {
    if (value!.isEmpty) {
      return "Price required";
    }
    return null;
  }

  void _addProductDetailsHandler() {
    if (_formKey.currentState!.validate()) {
      context.read<AddVegetablesBloc>().add(
            AddVegetablesPriceEvent(
              price: _productPriceController.text,
              units: _selectedUnit,
            ),
          );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        height: 350,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add Product Details",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: TextFormField(
                onTapOutside: (event) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                inputFormatters: [_formatter],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _productPriceController,
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Enter the price",
                    prefixIcon: Icon(Icons.currency_rupee_outlined)),
                validator: (value) => _priceValidationHandler(value),
              ),
            ),
            const SizedBox(height: 15),
            const Text("Above price is per: "),
            const SizedBox(height: 5),
            Wrap(
              spacing: 5,
              children: [
                FilterChip(
                  selected: _selectedUnit == "1 Kg",
                  label: const Text("1 Kg"),
                  onSelected: (value) => _selectedUnitsHandler("1 Kg"),
                ),
                FilterChip(
                  selected: _selectedUnit == "500 grams",
                  label: const Text("500 grams"),
                  onSelected: (value) => _selectedUnitsHandler("500 grams"),
                ),
                FilterChip(
                  selected: _selectedUnit == "Single piece",
                  label: const Text("Single piece"),
                  onSelected: (value) => _selectedUnitsHandler("Single piece"),
                ),
              ],
            ),
            const Expanded(child: SizedBox.shrink()),
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
                      onPressed: _addProductDetailsHandler,
                      child: const Text("Add"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
