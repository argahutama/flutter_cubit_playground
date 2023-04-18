import 'package:injectable/injectable.dart';
import 'package:playground/data/remote/cat_api.dart';
import 'package:playground/domain/model/cat_facts.dart';

import '../common/base/use_case.dart';
import '../injection.dart';

@singleton
class GetCatFactsUseCase extends UseCase<int, CatFacts> {
  @override
  Future<CatFacts> invoke(int request) => getIt<CatApi>().getCatFacts(request);
}
