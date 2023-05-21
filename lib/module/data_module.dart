import 'package:common/common.dart';
import 'package:common/env.dart';
import 'package:data/remote/cat_api.dart';
import 'package:data/remote/dio/dio_error_interceptor.dart';
import 'package:data/remote/dio/dio_http_interceptor.dart';
import 'package:data/repository/cat_repository.dart';
import 'package:domain/repository/cat_repository.dart';

@module
abstract class CatModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: AppEnv.baseUrl,
          responseType: ResponseType.plain,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        ),
      )
        ..interceptors.add(DioErrorInterceptor())
        ..interceptors.add(DioHttpInterceptor());

  @lazySingleton
  CatApi get catApi;

  @LazySingleton(as: CatRepository)
  CatRepositoryImpl get catRepository;
}
