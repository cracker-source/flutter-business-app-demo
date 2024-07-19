import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/business_verification.dart';
import '../../../services/verification/verification_repository.dart';

part 'business_verification_event.dart';
part 'business_verification_state.dart';

class BusinessVerificationBloc
    extends Bloc<BusinessVerificationEvent, BusinessVerificationState> {
  final VerificationRepository verificationRepository;

  BusinessVerificationBloc(this.verificationRepository)
      : super(
          const BusinessVerificationInitialState(
            BusinessVerification(
              shopPhotosList: [],
              panCardDetailsList: [],
              pancardNumber: '',
              businessLocation: [],
            ),
          ),
        ) {
    on<BusinessVerificationRequested>(
      _businessVerificationRequested,
    );
    on<BusinessVerificationPancardPhotosEvent>(
      _businessVerificationPancardPhotosEvent,
    );
    on<BusinessVerificationShopPhotosEvent>(
      _businessVerificationShopPhotosEvent,
    );

    on<BussinessVerificationLocationEvent>(
      _businessVerificationBusinessLocationEvent,
    );
  }

  Future<void> _businessVerificationRequested(event, emit) async {
    try {
      emit(BusinessVerificationLoadingState(state.businessVerification));

      final Response pancardImagesUrls = await verificationRepository
          .uploadPancardPhotos(state.businessVerification.panCardDetailsList);

      final Response shopImagesUrls = await verificationRepository
          .uploadShopPhotos(state.businessVerification.shopPhotosList);

      await verificationRepository.submitVerificationDetails(
        businessLocation: state.businessVerification.businessLocation,
        panCardDetailsList: pancardImagesUrls.data["data"],
        pancardNumber: event.pancardNumber,
        shopPhotosList: shopImagesUrls.data["data"],
      );

      emit(BusinessVerificationSuccessState(state.businessVerification));
    } catch (e) {
      emit(BusinessVerificationErrorState(state.businessVerification));
    }
  }

  void _businessVerificationPancardPhotosEvent(event, emit) {
    emit(BusinessVerificationPanCardLoadingState(state.businessVerification));

    emit(
      BusinessVerificationPanCardAddedState(
        state.businessVerification.copyWith(
          panCardDetailsList: event.panCardDetailsList,
        ),
      ),
    );
  }

  void _businessVerificationShopPhotosEvent(event, emit) {
    emit(BusinessVerificationShopLoadingState(state.businessVerification));

    emit(
      BusinessVerificationShopAddedState(
        state.businessVerification.copyWith(
          shopPhotosList: event.shopPhotosList,
        ),
      ),
    );
  }

  void _businessVerificationBusinessLocationEvent(event, emit) {
    emit(
      BusinessVerificationLocationState(
        state.businessVerification.copyWith(
          businessLocation: event.businessLocation,
        ),
      ),
    );
  }
}
