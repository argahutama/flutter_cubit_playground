import 'package:common/base/use_case.dart';

import '../model/cat_facts.dart';
import '../repository/cat_repository.dart';

class GetCatFactsUseCase extends UseCase<int, CatFacts> {
  final CatRepository _repository;

  GetCatFactsUseCase(this._repository);

  @override
  Future<CatFacts> invoke(int request) => _repository.getCatFacts(request);
}
