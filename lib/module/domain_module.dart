import 'package:domain/get_cat_facts_use_case.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  @lazySingleton
  GetCatFactsUseCase get catUseCase;
}
