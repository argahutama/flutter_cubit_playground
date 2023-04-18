import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:playground/env.dart';

import 'dio_error_interceptor.dart';

@lazySingleton
class CatFactDio {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppEnv.baseUrl,
      responseType: ResponseType.plain,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  )..interceptors.add(DioErrorInterceptor());
}
