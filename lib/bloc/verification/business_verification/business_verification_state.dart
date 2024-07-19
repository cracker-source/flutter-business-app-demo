part of 'business_verification_bloc.dart';

abstract class BusinessVerificationState extends Equatable {
  final BusinessVerification businessVerification;

  const BusinessVerificationState(this.businessVerification);

  @override
  List<Object> get props => [
        businessVerification.businessLocation,
        businessVerification.panCardDetailsList,
        businessVerification.pancardNumber,
        businessVerification.shopPhotosList
      ];
}

class BusinessVerificationInitialState extends BusinessVerificationState {
  const BusinessVerificationInitialState(super.businessVerification);

  @override
  List<Object> get props => [];
}

class BusinessVerificationLoadingState extends BusinessVerificationState {
  const BusinessVerificationLoadingState(super.businessVerification);

  @override
  List<Object> get props => [];
}

class BusinessVerificationSuccessState extends BusinessVerificationState {
  const BusinessVerificationSuccessState(super.businessVerification);

  @override
  List<Object> get props => [];
}

class BusinessVerificationErrorState extends BusinessVerificationState {
  const BusinessVerificationErrorState(super.businessVerification);

  @override
  List<Object> get props => [];
}

class BusinessVerificationPanCardAddedState extends BusinessVerificationState {
  const BusinessVerificationPanCardAddedState(super.businessVerification);

  @override
  List<Object> get props => [];
}

class BusinessVerificationPanCardLoadingState
    extends BusinessVerificationState {
  const BusinessVerificationPanCardLoadingState(super.businessVerification);

  @override
  List<Object> get props => [];
}

class BusinessVerificationLocationState extends BusinessVerificationState {
  const BusinessVerificationLocationState(super.businessVerification);

  @override
  List<Object> get props => [];
}

class BusinessVerificationShopLoadingState extends BusinessVerificationState {
  const BusinessVerificationShopLoadingState(super.businessVerification);

  @override
  List<Object> get props => [];
}

class BusinessVerificationShopAddedState extends BusinessVerificationState {
  const BusinessVerificationShopAddedState(super.businessVerification);

  @override
  List<Object> get props => [];
}
