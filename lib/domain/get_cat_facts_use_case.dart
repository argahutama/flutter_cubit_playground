import 'package:injectable/injectable.dart';
import 'package:playground/domain/model/cat_facts.dart';
import 'package:playground/domain/repository/cat_repository.dart';

import '../common/base/use_case.dart';
import '../injection.dart';

@lazySingleton
class GetCatFactsUseCase extends UseCase<int, CatFacts> {
  @override
  Future<CatFacts> invoke(int request) =>
      getIt<CatRepository>().getCatFacts(request);
}
