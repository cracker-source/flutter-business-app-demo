import 'package:dio/dio.dart';

import '../../dio_client.dart';

import 'product_category_provider.dart';

class ProductCategoryRepository implements ProductCategoryProvider {
  @override
  Future getAllProductCategories() async {
    Response response = await dio.get(
      "/product/get-all-product-categories",
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
  Future getUserProductCategories() async {
    Response response = await dio.get(
      "/product/user-product-categories",
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
  Future addProductCategory(String categoryName) async {
    Response response = await dio.post(
      "/product/add-product-category",
      data: {
        "categoryName": categoryName,
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
