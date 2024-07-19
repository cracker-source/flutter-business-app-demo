import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/products/vegetables/add_vegetables/add_vegetables_bloc.dart';

class VegetableInfo extends StatefulWidget {
  final String image;
  final String name;

  const VegetableInfo({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  State<VegetableInfo> createState() => _VegetableInfoState();
}

class _VegetableInfoState extends State<VegetableInfo> {
  @override
  void initState() {
    super.initState();
    context.read<AddVegetablesBloc>().add(AddVegetablesPriceResetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.network(
              widget.image,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
            const SizedBox(width: 15),
            Text(
              widget.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Price",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            BlocBuilder<AddVegetablesBloc, AddVegetablesState>(
              buildWhen: (previous, current) {
                return current is AddVegetablesInitial ||
                    current is AddVegetablesPriceAddedState;
              },
              builder: (context, state) {
                if (state is AddVegetablesPriceAddedState) {
                  return Text("\u{20B9} ${state.price} per ${state.units}",
                      style: const TextStyle(fontWeight: FontWeight.bold));
                } else {
                  return const Text("Not added",
                      style: TextStyle(fontWeight: FontWeight.bold));
                }
              },
            )
          ],
        )
      ],
    );
  }
}
