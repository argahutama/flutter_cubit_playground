import 'package:data/data.dart';
import 'package:data/remote/dio/dio_instances.dart';
import 'package:domain/repository/cat_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CatModule {
  @lazySingleton
  CatApi get catApi;

  @lazySingleton
  CatFactDio get catFactDio;

  @LazySingleton(as: CatRepository)
  CatRepositoryImpl get catRepository;
}
