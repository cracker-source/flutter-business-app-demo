part of 'add_vegetables_bloc.dart';

abstract class AddVegetablesState extends Equatable {
  final String price;
  final String units;
  const AddVegetablesState({
    required this.price,
    required this.units,
  });

  @override
  List<Object> get props => [price, units];
}

class AddVegetablesInitial extends AddVegetablesState {
  const AddVegetablesInitial({required super.price, required super.units});
}

class AddVegetablesLoadingState extends AddVegetablesState {
  const AddVegetablesLoadingState({
    required super.price,
    required super.units,
  });
}

class AddVegetablesSuccessState extends AddVegetablesState {
  const AddVegetablesSuccessState({required super.price, required super.units});
}

class AddVegetablesErrorState extends AddVegetablesState {
  const AddVegetablesErrorState({required super.price, required super.units});
}

class AddVegetablesPriceAddedState extends AddVegetablesState {
  const AddVegetablesPriceAddedState(
      {required super.price, required super.units});
}
