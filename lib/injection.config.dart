// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i3;
import 'package:data/remote/dio/dio_instances.dart' as _i4;
import 'package:domain/get_cat_facts_use_case.dart' as _i7;
import 'package:domain/repository/cat_repository.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:home/cubit/cat_facts_cubit.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'module/data_module.dart' as _i10;
import 'module/domain_module.dart' as _i9;
import 'module/home_module.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final catModule = _$CatModule(this);
    final homeModule = _$HomeModule();
    final domainModule = _$DomainModule();
    gh.lazySingleton<_i3.CatApi>(() => catModule.catApi);
    gh.lazySingleton<_i4.CatFactDio>(() => catModule.catFactDio);
    gh.lazySingleton<_i5.CatFactsCubit>(() => homeModule.catFactsCubit);
    gh.lazySingleton<_i6.CatRepository>(() => catModule.catRepository);
    gh.lazySingleton<_i7.GetCatFactsUseCase>(() => domainModule.catUseCase);
    return this;
  }
}

class _$HomeModule extends _i8.HomeModule {
  @override
  _i5.CatFactsCubit get catFactsCubit => _i5.CatFactsCubit();
}

class _$DomainModule extends _i9.DomainModule {
  @override
  _i7.GetCatFactsUseCase get catUseCase => _i7.GetCatFactsUseCase();
}

class _$CatModule extends _i10.CatModule {
  _$CatModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.CatApi get catApi => _i3.CatApi();
  @override
  _i4.CatFactDio get catFactDio => _i4.CatFactDio();
  @override
  _i3.CatRepositoryImpl get catRepository =>
      _i3.CatRepositoryImpl(_getIt<_i3.CatApi>());
}
