import 'package:common/base/use_case.dart';
import 'package:common/injection.dart';

import '../model/cat_facts.dart';
import '../repository/cat_repository.dart';

class GetCatFactsUseCase extends UseCase<int, CatFacts> {
  @override
  Future<CatFacts> invoke(int request) =>
      getIt<CatRepository>().getCatFacts(request);
}
