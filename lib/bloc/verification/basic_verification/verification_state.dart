part of 'verification_bloc.dart';

@immutable
abstract class VerificationState extends Equatable {
  final BusinessVerificationDetails businessVerification;

  const VerificationState({required this.businessVerification});

  @override
  List<Object> get props => [businessVerification];
}

class VerificationInitialState extends VerificationState {
  const VerificationInitialState({required super.businessVerification});

  @override
  List<Object> get props => [];
}

class VerificationLoadingState extends VerificationState {
  const VerificationLoadingState({required super.businessVerification});

  @override
  List<Object> get props => [];
}

class VerificationLoadedState extends VerificationState {
  const VerificationLoadedState({required super.businessVerification});

  @override
  List<Object> get props => [];
}

class VerificationUserAuthorized extends VerificationState {
  const VerificationUserAuthorized({required super.businessVerification});

  @override
  List<Object> get props => [];
}

class VerificationUserUnAuthorized extends VerificationState {
  const VerificationUserUnAuthorized({required super.businessVerification});

  @override
  List<Object> get props => [];
}

class VerificationErrorState extends VerificationState {
  const VerificationErrorState({required super.businessVerification});

  @override
  List<Object> get props => [];
}

// SELECT CATEGORY STATE

class VerificationCategoryLoadingState extends VerificationState {
  const VerificationCategoryLoadingState({required super.businessVerification});

  @override
  List<Object> get props => [];
}

class VerificationCategorySuccessState extends VerificationState {
  const VerificationCategorySuccessState({required super.businessVerification});

  @override
  List<Object> get props => [];
}

class VerificationCategoryErrorState extends VerificationState {
  const VerificationCategoryErrorState({required super.businessVerification});

  @override
  List<Object> get props => [];
}

// EMAIL VERIFICATION STATE

// MOBILE NUMBER VERIFICATION STATE

// BUSINESS VERIFICATION STATE

class VerificationBusinessInitialState extends VerificationState {
  final List<XFile>? shopPhotosList;
  final List<XFile>? panCardDetailsList;
  final String pancardNumber;

  const VerificationBusinessInitialState({
    required super.businessVerification,
    required this.shopPhotosList,
    required this.panCardDetailsList,
    required this.pancardNumber,
  });

  @override
  List<Object> get props => [
        pancardNumber,
      ];

  VerificationBusinessInitialState copyWith({
    List<XFile>? shopPhotosList,
    List<XFile>? panCardDetailsList,
    String? pancardNumber,
  }) {
    return VerificationBusinessInitialState(
        shopPhotosList: shopPhotosList ?? this.shopPhotosList,
        panCardDetailsList: panCardDetailsList ?? this.panCardDetailsList,
        pancardNumber: pancardNumber ?? this.pancardNumber,
        businessVerification: businessVerification);
  }
}

class VerificationBusinessSuccessState extends VerificationState {
  const VerificationBusinessSuccessState({required super.businessVerification});

  @override
  List<Object> get props => [];
}

class VerificationBusinessErrorState extends VerificationState {
  const VerificationBusinessErrorState({required super.businessVerification});

  @override
  List<Object> get props => [];
}
