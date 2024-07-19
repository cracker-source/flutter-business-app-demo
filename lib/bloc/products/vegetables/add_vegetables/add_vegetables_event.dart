part of 'add_vegetables_bloc.dart';

abstract class AddVegetablesEvent extends Equatable {
  const AddVegetablesEvent();

  @override
  List<Object> get props => [];
}

class AddVegetableEvent extends AddVegetablesEvent {
  final String vegetableName;

  const AddVegetableEvent({required this.vegetableName});
}

class AddVegetablesPriceEvent extends AddVegetablesEvent {
  final String price;
  final String units;

  const AddVegetablesPriceEvent({
    required this.price,
    required this.units,
  });
}

class AddVegetablesPriceResetEvent extends AddVegetablesEvent {}
