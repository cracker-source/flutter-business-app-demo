part of 'user_vegetables_bloc.dart';

abstract class UserVegetablesState extends Equatable {
  const UserVegetablesState();

  @override
  List<Object> get props => [];
}

class UserVegetablesInitial extends UserVegetablesState {}

class UserVegetablesLoadingState extends UserVegetablesState {}

class UserVegetablesLoadedState extends UserVegetablesState {
  final List<dynamic> userVegetables;

  const UserVegetablesLoadedState({required this.userVegetables});
}

class UserVegetablesErrorState extends UserVegetablesState {}
