import 'package:common/common.dart';
import 'package:playground/data/model/cat_fact_response.dart';
import 'package:playground/domain/model/cat_facts.dart';

class CatFactMapper extends Mapper<CatFactResponse, CatFacts> {
  @override
  CatFacts map({required CatFactResponse from}) {
    final data = from.data?.mapToList((e) => e.fact.orEmpty());
    return CatFacts(
      currentPage: from.currentPage ?? 0,
      total: from.total ?? 0,
      nextPageUrl: from.nextPageUrl,
      prevPageUrl: from.prevPageUrl,
      data: data.orEmpty(),
    );
  }
}
