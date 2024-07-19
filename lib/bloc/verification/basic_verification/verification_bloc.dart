import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/business_verification_details.dart';
import '../../../services/verification/verification_repository.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final VerificationRepository _verificationRepository;

  VerificationBloc(this._verificationRepository)
      : super(
          const VerificationInitialState(
            businessVerification: BusinessVerificationDetails(
              isBusinessCategorySelected: false,
              isEmailVerified: false,
              isBusinessNumerVerified: false,
              isVerificationDetailsSubmitted: false,
              isBusinessVerified: false,
            ),
          ),
        ) {
    on<VerificationDetailsLoadEvent>(_verificationDetailsLoadEvent);

    on<VerificationDetailsAddCategoryEvent>(
        _verificationDetailsAddCategoryEvent);
  }

  Future<void> _verificationDetailsLoadEvent(event, emit) async {
    try {
      emit(
        VerificationLoadingState(
          businessVerification: state.businessVerification,
        ),
      );

      final response = await _verificationRepository.getVerificationDetails();

      emit(
        VerificationLoadedState(
          businessVerification: state.businessVerification.copyWith(
            isBusinessCategorySelected:
                response["data"]["business"]["businessCategory"] == ""
                    ? false
                    : true,
            isBusinessNumerVerified: response["data"]["business"]
                ["isBusinessNumerVerified"],
            isBusinessVerified: response["data"]["business"]
                ["isBusinessVerified"],
            isEmailVerified: response["data"]["business"]["isEmailVerified"],
            isVerificationDetailsSubmitted: response["data"]["business"]
                ["isVerificationDetailsSubmitted"],
          ),
        ),
      );

      if (!state.businessVerification.isBusinessCategorySelected ||
          !state.businessVerification.isBusinessNumerVerified ||
          !state.businessVerification.isBusinessVerified ||
          !state.businessVerification.isEmailVerified ||
          !state.businessVerification.isVerificationDetailsSubmitted) {
        emit(VerificationUserUnAuthorized(
            businessVerification: state.businessVerification));
      } else {
        emit(VerificationUserAuthorized(
            businessVerification: state.businessVerification));
      }
    } catch (e) {
      emit(
        VerificationErrorState(
          businessVerification: state.businessVerification,
        ),
      );
    }
  }

  Future<void> _verificationDetailsAddCategoryEvent(event, emit) async {
    try {
      emit(
        VerificationCategoryLoadingState(
          businessVerification: state.businessVerification,
        ),
      );

      await _verificationRepository.addShopCategory(event.categoryName);

      emit(
        VerificationCategorySuccessState(
          businessVerification: state.businessVerification,
        ),
      );
    } catch (e) {
      emit(
        VerificationCategoryErrorState(
          businessVerification: state.businessVerification,
        ),
      );
    }
  }
}
