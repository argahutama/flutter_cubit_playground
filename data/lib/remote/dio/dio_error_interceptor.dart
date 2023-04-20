import 'dart:convert';

import 'package:common/base/network_error.dart';
import 'package:dio/dio.dart';

class DioErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != null) {
      final responseBody =
          NetworkError.fromJson(json.decode(err.response?.data));
      final response = err.response;
      final errorMessage = responseBody.message ?? 'Unknown error';
      response?.data = errorMessage;
      return super.onError(
        DioError(
          requestOptions: err.requestOptions,
          response: response,
          message: errorMessage,
        ),
        handler,
      );
    }
    return super.onError(err, handler);
  }
}
