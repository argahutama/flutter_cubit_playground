import 'package:domain/model/cat_facts.dart';
import 'package:domain/repository/cat_repository.dart';

import '../remote/cat_api.dart';

class CatRepositoryImpl extends CatRepository {
  final CatApi _catApi;

  CatRepositoryImpl(this._catApi);

  @override
  Future<CatFacts> getCatFacts(int page) {
    return _catApi.getCatFacts(page);
  }
}
