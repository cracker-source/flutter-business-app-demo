part of 'all_vegetables_bloc.dart';

abstract class AllVegetablesEvent extends Equatable {
  const AllVegetablesEvent();

  @override
  List<Object> get props => [];
}

class AllVegetablesLoad extends AllVegetablesEvent {}
