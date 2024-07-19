part of 'business_verification_bloc.dart';

abstract class BusinessVerificationEvent extends Equatable {
  const BusinessVerificationEvent();

  @override
  List<Object> get props => [];
}

class BusinessVerificationRequested extends BusinessVerificationEvent {
  final String pancardNumber;

  const BusinessVerificationRequested({required this.pancardNumber});

  @override
  List<Object> get props => [pancardNumber];
}

class BussinessVerificationLocationEvent extends BusinessVerificationEvent {
  final List<double> businessLocation;

  const BussinessVerificationLocationEvent(this.businessLocation);

  @override
  List<Object> get props => [businessLocation];
}

class BusinessVerificationShopPhotosEvent extends BusinessVerificationEvent {
  final List<XFile> shopPhotosList;

  const BusinessVerificationShopPhotosEvent({required this.shopPhotosList});

  @override
  List<Object> get props => [shopPhotosList];
}

class BusinessVerificationPancardPhotosEvent extends BusinessVerificationEvent {
  final List<XFile> panCardDetailsList;

  const BusinessVerificationPancardPhotosEvent({
    required this.panCardDetailsList,
  });

  @override
  List<Object> get props => [panCardDetailsList];
}
