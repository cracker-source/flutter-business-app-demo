// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class BusinessVerification extends Equatable {
  final List<XFile> shopPhotosList;
  final List<XFile> panCardDetailsList;
  final String pancardNumber;
  final List<double> businessLocation;

  const BusinessVerification({
    required this.shopPhotosList,
    required this.panCardDetailsList,
    required this.pancardNumber,
    required this.businessLocation,
  });

  @override
  List<Object?> get props =>
      [shopPhotosList, panCardDetailsList, pancardNumber, businessLocation];

  BusinessVerification copyWith({
    List<XFile>? shopPhotosList,
    List<XFile>? panCardDetailsList,
    String? pancardNumber,
    List<double>? businessLocation,
  }) {
    return BusinessVerification(
      shopPhotosList: shopPhotosList ?? this.shopPhotosList,
      panCardDetailsList: panCardDetailsList ?? this.panCardDetailsList,
      pancardNumber: pancardNumber ?? this.pancardNumber,
      businessLocation: businessLocation ?? this.businessLocation,
    );
  }
}
