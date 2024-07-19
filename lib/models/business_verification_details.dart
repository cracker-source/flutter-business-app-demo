import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BusinessVerificationDetails extends Equatable {
  final bool isBusinessCategorySelected;
  final bool isEmailVerified;
  final bool isBusinessNumerVerified;
  final bool isVerificationDetailsSubmitted;
  final bool isBusinessVerified;

  const BusinessVerificationDetails({
    required this.isBusinessCategorySelected,
    required this.isEmailVerified,
    required this.isBusinessNumerVerified,
    required this.isVerificationDetailsSubmitted,
    required this.isBusinessVerified,
  });

  BusinessVerificationDetails copyWith({
    bool? isBusinessCategorySelected,
    bool? isEmailVerified,
    bool? isBusinessNumerVerified,
    bool? isVerificationDetailsSubmitted,
    bool? isBusinessVerified,
  }) {
    return BusinessVerificationDetails(
      isBusinessCategorySelected:
          isBusinessCategorySelected ?? this.isBusinessCategorySelected,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isBusinessNumerVerified:
          isBusinessNumerVerified ?? this.isBusinessNumerVerified,
      isVerificationDetailsSubmitted:
          isVerificationDetailsSubmitted ?? this.isVerificationDetailsSubmitted,
      isBusinessVerified: isBusinessVerified ?? this.isBusinessVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isBusinessCategorySelected': isBusinessCategorySelected,
      'isEmailVerified': isEmailVerified,
      'isBusinessNumerVerified': isBusinessNumerVerified,
      'isVerificationDetailsSubmitted': isVerificationDetailsSubmitted,
      'isBusinessVerified': isBusinessVerified,
    };
  }

  factory BusinessVerificationDetails.fromMap(Map<String, dynamic> map) {
    return BusinessVerificationDetails(
      isBusinessCategorySelected: map['isBusinessCategorySelected'] as bool,
      isEmailVerified: map['isEmailVerified'] as bool,
      isBusinessNumerVerified: map['isBusinessNumerVerified'] as bool,
      isVerificationDetailsSubmitted:
          map['isVerificationDetailsSubmitted'] as bool,
      isBusinessVerified: map['isBusinessVerified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessVerificationDetails.fromJson(String source) =>
      BusinessVerificationDetails.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        isBusinessCategorySelected,
        isEmailVerified,
        isVerificationDetailsSubmitted,
        isBusinessVerified,
        isBusinessNumerVerified
      ];
}
