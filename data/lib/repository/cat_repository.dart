import 'package:domain/domain.dart';

import '../remote/cat_api.dart';

class CatRepositoryImpl extends CatRepository {
  final CatApi catApi;

  CatRepositoryImpl(this.catApi);

  @override
  Future<CatFacts> getCatFacts(int page) {
    return catApi.getCatFacts(page);
  }
}
