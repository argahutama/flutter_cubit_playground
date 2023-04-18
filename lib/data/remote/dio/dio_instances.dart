import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:playground/env.dart';

@singleton
class CatFactDio {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppEnv.baseUrl,
      responseType: ResponseType.plain,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );
}
