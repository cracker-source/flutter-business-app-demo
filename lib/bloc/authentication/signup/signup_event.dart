part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {}

class SignupRequestedEvent extends SignupEvent {
  final String addressLaneTwo;
  final String password;
  final String confirmPassword;
  final BuildContext context;

  SignupRequestedEvent({
    required this.context,
    required this.addressLaneTwo,
    required this.password,
    required this.confirmPassword,
  });
  @override
  List<Object?> get props => [addressLaneTwo, password, confirmPassword];
}

class SignupSubmitFirstFormEvent extends SignupEvent {
  final String businessName;
  final String ownerName;
  final String mobileNumber;
  final String username;

  SignupSubmitFirstFormEvent({
    required this.businessName,
    required this.ownerName,
    required this.mobileNumber,
    required this.username,
  });

  @override
  List<Object?> get props => [businessName, ownerName, mobileNumber, username];
}

class SignupSubmitSecondFormEvent extends SignupEvent {
  final String email;
  final String stateName;
  final String cityName;

  SignupSubmitSecondFormEvent({
    required this.email,
    required this.stateName,
    required this.cityName,
  });

  @override
  List<Object?> get props => [email, stateName, cityName];
}

class SignupSubmitThirdFormEvent extends SignupEvent {
  final String pincode;
  final String districtName;
  final String addressLaneOne;

  SignupSubmitThirdFormEvent({
    required this.pincode,
    required this.districtName,
    required this.addressLaneOne,
  });

  @override
  List<Object?> get props => [pincode, districtName, addressLaneOne];
}
