import 'package:common/extension/dio_ext.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/cat_facts.dart';

import '../mapper/cat_fact_mapper.dart';
import '../model/cat_fact_response.dart';

class CatApi {
  final Dio _dio;

  CatApi(this._dio);

  Future<CatFacts> getCatFacts(int page) async {
    final response = await _dio.get(
      '/facts',
      queryParameters: {'page': page},
    );
    final CatFactResponse catFactResponse =
        response.map((e) => CatFactResponse.fromJson(e)) ??
            CatFactResponse.empty();
    return CatFactMapper().map(from: catFactResponse);
  }
}
