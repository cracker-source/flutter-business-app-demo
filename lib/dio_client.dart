import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'local_storage.dart';

final dioOptions = BaseOptions(
  // baseUrl: 'http://localhost:5000/api/v1/business',
  baseUrl: 'https://business-grow.onrender.com/api/v1/business',
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 5),
);

final Dio dio = Dio(dioOptions)
  ..interceptors.add(
    InterceptorsWrapper(onRequest: (options, handler) async {
      try {
        await LocalStorage.getToken().then((value) {
          if (value.isNotEmpty) {
            options.headers.putIfAbsent("Authorization", () => "Bearer $value");
          }
          handler.next(options);
        });
      } catch (e) {
        debugPrint("Error: $e");
      }
    }, onError: (DioException error, ErrorInterceptorHandler handler) async {
      if ((error.response?.statusCode != 200 ||
              error.response?.statusCode != 201) &&
          error.requestOptions.path != '/login' &&
          error.requestOptions.path != '/signup') {
        var response = await dio.request(
          error.requestOptions.path,
          data: error.requestOptions.data,
          queryParameters: error.requestOptions.queryParameters,
          options: Options(
            method: error.requestOptions.method,
            headers: error.requestOptions.headers,
          ),
        );
        return handler.resolve(response);
      }
      return handler.next(error);
    }),
  );
