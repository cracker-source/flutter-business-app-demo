// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class BusinessUser extends Equatable {
  final String businessName;
  final String ownerName;
  final String username;
  final String mobileNumber;
  final String emailId;
  final String stateName;
  final String pincode;
  final String districtName;
  final String cityName;
  final String addressLaneOne;
  final String addressLaneTwo;
  final String password;
  final String confirmPassword;

  const BusinessUser({
    required this.businessName,
    required this.ownerName,
    required this.mobileNumber,
    required this.emailId,
    required this.stateName,
    required this.pincode,
    required this.districtName,
    required this.cityName,
    required this.addressLaneOne,
    required this.addressLaneTwo,
    required this.password,
    required this.confirmPassword,
    required this.username,
  });

  BusinessUser copyWith({
    String? businessName,
    String? ownerName,
    String? mobileNumber,
    String? emailId,
    String? stateName,
    String? pincode,
    String? districtName,
    String? cityName,
    String? addressLaneOne,
    String? addressLaneTwo,
    String? password,
    String? confirmPassword,
    String? username,
  }) {
    return BusinessUser(
      businessName: businessName ?? this.businessName,
      ownerName: ownerName ?? this.ownerName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      emailId: emailId ?? this.emailId,
      stateName: stateName ?? this.stateName,
      pincode: pincode ?? this.pincode,
      districtName: districtName ?? this.districtName,
      cityName: cityName ?? this.cityName,
      addressLaneOne: addressLaneOne ?? this.addressLaneOne,
      addressLaneTwo: addressLaneTwo ?? this.addressLaneTwo,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'businessName': businessName,
      'ownerName': ownerName,
      'mobileNumber': mobileNumber,
      'emailId': emailId,
      'stateName': stateName,
      'pincode': pincode,
      'districtName': districtName,
      'cityName': cityName,
      'addressLaneOne': addressLaneOne,
      'addressLaneTwo': addressLaneTwo,
      'password': password,
      'confirmPassword': confirmPassword,
      'username': username,
    };
  }

  factory BusinessUser.fromMap(Map<String, dynamic> map) {
    return BusinessUser(
      businessName: map['businessName'] as String,
      ownerName: map['ownerName'] as String,
      mobileNumber: map['mobileNumber'] as String,
      emailId: map['emailId'] as String,
      stateName: map['stateName'] as String,
      pincode: map['pincode'] as String,
      districtName: map['districtName'] as String,
      cityName: map['cityName'] as String,
      addressLaneOne: map['addressLaneOne'] as String,
      addressLaneTwo: map['addressLaneTwo'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
      username: map["username"] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessUser.fromJson(String source) =>
      BusinessUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BusinessUser(businessName: $businessName, ownerName: $ownerName, mobileNumber: $mobileNumber, emailId: $emailId, stateName: $stateName, pincode: $pincode, districtName: $districtName, cityName: $cityName, addressLaneOne: $addressLaneOne, addressLaneTwo: $addressLaneTwo, password: $password, confirmPassword: $confirmPassword, username: $username)';
  }

  @override
  List<Object> get props {
    return [
      businessName,
      ownerName,
      username,
      mobileNumber,
      emailId,
      stateName,
      pincode,
      districtName,
      cityName,
      addressLaneOne,
      addressLaneTwo,
      password,
      confirmPassword,
    ];
  }
}
