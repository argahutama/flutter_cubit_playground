import 'package:injectable/injectable.dart';
import 'package:playground/common/extension/dio_ext.dart';
import 'package:playground/data/model/cat_fact_response.dart';
import 'package:playground/data/remote/dio/dio_instances.dart';
import 'package:playground/domain/mapper/cat_fact_mapper.dart';
import 'package:playground/domain/model/cat_facts.dart';
import 'package:playground/injection.dart';

@singleton
class CatApi {
  Future<CatFacts> getCatFacts(int page) async {
    final response = await getIt<CatFactDio>().dio.get(
      "/facts",
      queryParameters: {"page": page},
    );
    final CatFactResponse catFactResponse =
        response.map((e) => CatFactResponse.fromJson(e));
    return CatFactMapper().map(from: catFactResponse);
  }
}
