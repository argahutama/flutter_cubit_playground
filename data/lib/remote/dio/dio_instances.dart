import 'package:common/env.dart';
import 'package:data/remote/dio/dio_http_interceptor.dart';
import 'package:dio/dio.dart';

import 'dio_error_interceptor.dart';

class CatFactDio {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppEnv.baseUrl,
      responseType: ResponseType.plain,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  )
    ..interceptors.add(DioErrorInterceptor())
    ..interceptors.add(DioHttpInterceptor());
}
