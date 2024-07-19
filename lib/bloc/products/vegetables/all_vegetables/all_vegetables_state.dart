part of 'all_vegetables_bloc.dart';

abstract class AllVegetablesState extends Equatable {
  const AllVegetablesState();

  @override
  List<Object> get props => [];
}

class AllVegetablesInitial extends AllVegetablesState {}

class AllVegetablesLoadingState extends AllVegetablesState {}

class AllVegetablesLoadedState extends AllVegetablesState {
  final List<dynamic> allVegetables;

  const AllVegetablesLoadedState({required this.allVegetables});

  @override
  List<Object> get props => [allVegetables];
}

class AllVegetablesErrorState extends AllVegetablesState {}
