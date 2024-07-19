part of 'signup_bloc.dart';

@immutable
abstract class SignupState extends Equatable {
  final BusinessUser businessUser;
  const SignupState({required this.businessUser});

  @override
  List<Object> get props => [businessUser];
}

class SignupInitialState extends SignupState {
  const SignupInitialState({required super.businessUser});
}

class SignupLoadingState extends SignupState {
  const SignupLoadingState({required super.businessUser});
}

class SignupFirstFormState extends SignupState {
  const SignupFirstFormState({required super.businessUser});
}

class SignupSecondFormState extends SignupState {
  const SignupSecondFormState({required super.businessUser});
}

class SignupThirdFormState extends SignupState {
  const SignupThirdFormState({required super.businessUser});
}

class SignupSuccessfullState extends SignupState {
  const SignupSuccessfullState({required super.businessUser});
}

class SignupErrorState extends SignupState {
  const SignupErrorState({required super.businessUser});
}
