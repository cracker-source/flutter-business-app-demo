import 'package:dio/dio.dart';

import '../../../dio_client.dart';
import '../../../services/products/vegetables/vegetables_provider.dart';

class VegetablesRepository implements VegetablesProvider {
  @override
  Future loadAllVegetables() async {
    Response response = await dio.get(
      "/vegetable/get-all-vegetables",
      options: Options(
        contentType: "application/json",
        method: "GET",
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    return response;
  }

  @override
  Future addVegetable({
    required String vegetableName,
    required String units,
    required String price,
  }) async {
    Response response = await dio.post(
      "/vegetable/create-business-vegetable",
      data: {
        "vegetableName": vegetableName,
        "price": price,
        "units": units,
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

  @override
  Future loadUserVegetables() async {
    Response response = await dio.get(
      "/vegetable/get-business-user-vegetables",
      options: Options(
        contentType: "application/json",
        method: "GET",
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    return response;
  }
}
