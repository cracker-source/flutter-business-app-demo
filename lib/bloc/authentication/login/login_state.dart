part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginSuccessfullState extends LoginState {}

class LoginUserAvailableInitialState extends LoginState {}

class LoginUserAvailableState extends LoginState {}

class LoginUserAvailableErrorState extends LoginState {}

class LoginErrorState extends LoginState {}
