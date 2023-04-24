import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHttpInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}]: ${options.uri}');
    debugPrint('REQUEST HEADERS: ${options.headers}');
    debugPrint('REQUEST DATA: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}]: ${response.requestOptions.uri}');
    debugPrint('RESPONSE HEADERS: ${response.headers}');
    debugPrint('RESPONSE DATA: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final uri = err.requestOptions.uri;
    debugPrint('ERROR[${statusCode ?? 'unknown'}]: $uri');
    debugPrint('ERROR MESSAGE: ${err.message}');
    super.onError(err, handler);
  }
}
