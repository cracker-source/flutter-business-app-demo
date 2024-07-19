import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:social/dio_client.dart';
import 'package:social/local_storage.dart';
import 'package:social/models/business_user.dart';
import 'package:social/services/auth/auth_provider.dart';
import 'package:social/utils/utils.dart';

class AuthRepository implements AuthProvider {
  @override
  Future<dynamic> createBusiness({
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
  }) async {
    try {
      Response response = await dio.post(
        "/auth/register-business",
        data: BusinessUser(
          businessName: businessName,
          ownerName: ownerName,
          mobileNumber: mobileNumber,
          emailId: emailId,
          stateName: stateName,
          pincode: pincode,
          districtName: districtName,
          cityName: cityName,
          addressLaneOne: addressLaneOne,
          addressLaneTwo: addressLaneTwo,
          password: password,
          confirmPassword: confirmPassword,
          username: username,
        ).toJson(),
        options: Options(
          contentType: "application/json",
          method: "POST",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (response.data["status"] != "error" && response.data['token'] != "") {
        await LocalStorage.setToken(response.data['token']);
        if (context.mounted) {
          context.go("/authorization");
        }
      } else {
        if (response.data['message'].contains("`emailId` to be unique")) {
          throw Exception("Email Id is already in use, Try using a new one");
        } else if (response.data['message']
            .contains("`mobileNumber` to be unique")) {
          throw Exception(
            "Business number is already registered, Try using a new one",
          );
        } else if (response.data['message']
            .contains("`username` to be unique")) {
          throw Exception(
            "Username is already taken, Try different one",
          );
        } else {
          return response.data["status"];
        }
      }
      return response.data["status"];
    } catch (e) {
      if (e is DioException) {
        showSnackBar(e.message.toString());
      } else {
        showSnackBar(e.toString().substring(11));
      }
    }
  }

  @override
  Future<bool> get isLoggedIn async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    final secureKey = await secureStorage.read(key: "secureKey");
    return secureKey!.isEmpty ? false : true;
  }

  @override
  Future<void> logInBusiness({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "/auth/login-business",
        data: {
          "email": email,
          "password": password,
        },
        options: Options(
          contentType: "application/json",
          method: "POST",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (response.data["status"] != "error" && response.data['token'] != "") {
        LocalStorage.setToken(response.data['token']);
      }
    } catch (e) {
      if (e is DioException) {
        showSnackBar(e.message.toString());
      } else {
        showSnackBar(e.toString().substring(11));
      }
    }
  }
}
