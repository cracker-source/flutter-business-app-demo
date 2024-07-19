import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:social/models/business_user.dart';
import 'package:social/services/auth/auth_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;

  SignupBloc({required this.authRepository})
      : super(
          const SignupInitialState(
            businessUser: BusinessUser(
              businessName: "",
              ownerName: "",
              mobileNumber: "",
              emailId: "",
              stateName: "",
              pincode: "",
              districtName: "",
              cityName: "",
              addressLaneOne: "",
              addressLaneTwo: "",
              password: "",
              confirmPassword: "",
              username: "",
            ),
          ),
        ) {
    on<SignupRequestedEvent>(_signupRequestedEvent);
    on<SignupSubmitFirstFormEvent>(_signupFirstFormEvent);
    on<SignupSubmitSecondFormEvent>(_signupSecondFormEvent);
    on<SignupSubmitThirdFormEvent>(_signupThirdFormEvent);
  }

  void _signupRequestedEvent(event, emit) async {
    emit(SignupLoadingState(businessUser: state.businessUser));

    final user = state.businessUser;
    try {
      final String response = await authRepository.createBusiness(
        businessName: user.businessName,
        ownerName: user.ownerName,
        mobileNumber: user.mobileNumber,
        emailId: user.emailId,
        stateName: user.stateName,
        pincode: user.pincode,
        districtName: user.districtName,
        cityName: user.cityName,
        addressLaneOne: user.addressLaneOne,
        addressLaneTwo: event.addressLaneTwo,
        password: event.password,
        confirmPassword: event.confirmPassword,
        username: user.username,
        context: event.context,
      );

      if (response == "success") {
        emit(
          SignupInitialState(
            businessUser: user.copyWith(
              businessName: "",
              ownerName: "",
              mobileNumber: "",
              emailId: "",
              stateName: "",
              pincode: "",
              districtName: "",
              cityName: "",
              addressLaneOne: "",
              addressLaneTwo: "",
              password: "",
              confirmPassword: "",
              username: "",
            ),
          ),
        );

        emit(SignupSuccessfullState(businessUser: state.businessUser));
      } else {
        emit(SignupErrorState(businessUser: state.businessUser));
      }
    } catch (e) {
      emit(SignupErrorState(businessUser: state.businessUser));
    }
  }

  void _signupFirstFormEvent(event, emit) {
    emit(
      SignupFirstFormState(
        businessUser: state.businessUser.copyWith(
          businessName: event.businessName,
          ownerName: event.ownerName,
          mobileNumber: event.mobileNumber,
          username: event.username,
        ),
      ),
    );
  }

  void _signupSecondFormEvent(event, emit) {
    emit(
      SignupSecondFormState(
        businessUser: state.businessUser.copyWith(
          emailId: event.email,
          stateName: event.stateName,
          cityName: event.cityName,
        ),
      ),
    );
  }

  void _signupThirdFormEvent(event, emit) {
    emit(
      SignupThirdFormState(
        businessUser: state.businessUser.copyWith(
          pincode: event.pincode,
          districtName: event.districtName,
          addressLaneOne: event.addressLaneOne,
        ),
      ),
    );
  }
}
