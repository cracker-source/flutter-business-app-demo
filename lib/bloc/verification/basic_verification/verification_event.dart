part of 'verification_bloc.dart';

@immutable
abstract class VerificationEvent extends Equatable {
  const VerificationEvent();

  @override
  List<Object?> get props => [];
}

class VerificationDetailsLoadEvent extends VerificationEvent {
  const VerificationDetailsLoadEvent();
  @override
  List<Object> get props => [];
}

class VerificationDetailsAddCategoryEvent extends VerificationEvent {
  final String categoryName;

  const VerificationDetailsAddCategoryEvent({required this.categoryName});
  @override
  List<Object> get props => [categoryName];
}
