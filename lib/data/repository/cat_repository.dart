import 'package:injectable/injectable.dart';
import 'package:playground/data/remote/cat_api.dart';
import 'package:playground/domain/model/cat_facts.dart';
import 'package:playground/domain/repository/cat_repository.dart';

@LazySingleton(as: CatRepository)
class CatRepositoryImpl extends CatRepository {
  final CatApi catApi;

  CatRepositoryImpl(this.catApi);

  @override
  Future<CatFacts> getCatFacts(int page) {
    return catApi.getCatFacts(page);
  }
}
