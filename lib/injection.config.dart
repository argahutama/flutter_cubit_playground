// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/remote/cat_api.dart' as _i3;
import 'data/remote/dio/dio_instances.dart' as _i4;
import 'data/repository/cat_repository.dart' as _i7;
import 'domain/get_cat_facts_use_case.dart' as _i8;
import 'domain/repository/cat_repository.dart' as _i6;
import 'presentation/cubit/cat_facts_cubit.dart' as _i5;

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
    gh.lazySingleton<_i3.CatApi>(() => _i3.CatApi());
    gh.lazySingleton<_i4.CatFactDio>(() => _i4.CatFactDio());
    gh.lazySingleton<_i5.CatFactsCubit>(() => _i5.CatFactsCubit());
    gh.lazySingleton<_i6.CatRepository>(
        () => _i7.CatRepositoryImpl(gh<_i3.CatApi>()));
    gh.lazySingleton<_i8.GetCatFactsUseCase>(() => _i8.GetCatFactsUseCase());
    return this;
  }
}
