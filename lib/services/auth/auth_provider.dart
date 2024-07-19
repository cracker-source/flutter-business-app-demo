import 'package:flutter/material.dart';

abstract class AuthProvider {
  Future<bool> get isLoggedIn;

  void logInBusiness({
    required String email,
    required String password,
  });

  void createBusiness({
    required String businessName,
    required String ownerName,
    required String mobileNumber,
    required String emailId,
    required String stateName,
    required String pincode,
    required String districtName,
    required String cityName,
    required String addressLaneOne,
    required String addressLaneTwo,
    required String password,
    required String confirmPassword,
    required String username,
    required BuildContext context,
  });
}
