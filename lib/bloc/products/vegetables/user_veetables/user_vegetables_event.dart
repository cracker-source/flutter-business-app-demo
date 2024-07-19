part of 'user_vegetables_bloc.dart';

abstract class UserVegetablesEvent extends Equatable {
  const UserVegetablesEvent();

  @override
  List<Object> get props => [];
}

class UserVegetablesLoadEvent extends UserVegetablesEvent {}
