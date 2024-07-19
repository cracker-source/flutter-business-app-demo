import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/services/verification/verification_provider.dart';

import '../../dio_client.dart';

class VerificationRepository implements VerificationProvider {
  @override
  Future<dynamic> getVerificationDetails() async {
    Response response = await dio.get(
      "/auth/get-business-verification-details",
      options: Options(
        contentType: "application/json",
        method: "GET",
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    final jsonResponse = response.data;
    return jsonResponse;
  }

  @override
  Future<dynamic> addShopCategory(String categoryName) async {
    Response response = await dio.post(
      "/auth/add-business-category",
      data: {"businessCategory": categoryName},
      options: Options(
        contentType: "application/json",
        method: "POST",
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    return response;
  }

  @override
  Future<dynamic> uploadPancardPhotos(List<XFile> pancardPhotos) async {
    FormData formData = FormData.fromMap({});

    for (XFile item in pancardPhotos) {
      String fileName = item.path.split('/').last;
      formData.files.addAll([
        MapEntry(
          "verificationImages",
          await MultipartFile.fromFile(
            item.path,
            filename: fileName,
            contentType: MediaType("image", "jpeg"),
          ),
        ),
      ]);
    }

    Response response = await dio.post(
      "/auth/add-pan-card",
      data: formData,
      options: Options(
        contentType: "multipart/form-data",
        method: "POST",
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  }

  @override
  Future<dynamic> uploadShopPhotos(List<XFile> shopPhotos) async {
    FormData formData = FormData.fromMap({});

    for (XFile item in shopPhotos) {
      String fileName = item.path.split('/').last;
      formData.files.addAll([
        MapEntry(
          "shopImages",
          await MultipartFile.fromFile(
            item.path,
            filename: fileName,
            contentType: MediaType("image", "jpeg"),
          ),
        ),
      ]);
    }

    final Response response = await dio.post(
      "/auth/add-shop-images",
      data: formData,
      options: Options(
        contentType: "multipart/form-data",
        method: "POST",
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  }

  @override
  Future<dynamic> submitVerificationDetails({
    required List<dynamic> shopPhotosList,
    required List<dynamic> panCardDetailsList,
    required String pancardNumber,
    required List<double> businessLocation,
  }) async {
    Response response = await dio.post(
      "/auth/verify",
      data: {
        "businessLocation": businessLocation,
        "panCardVerification": panCardDetailsList,
        "pancardNumber": pancardNumber,
        "businessOrShopPhotos": shopPhotosList,
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

    return response;
  }
}
