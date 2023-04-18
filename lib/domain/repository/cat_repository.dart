import '../model/cat_facts.dart';

abstract class CatRepository {
  Future<CatFacts> getCatFacts(int page);
}
