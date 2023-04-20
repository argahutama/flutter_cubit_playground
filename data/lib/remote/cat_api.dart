import 'package:common/extension/dio_ext.dart';
import 'package:common/injection.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

import '../mapper/cat_fact_mapper.dart';
import 'dio/dio_instances.dart';

class CatApi {
  Future<CatFacts> getCatFacts(int page) async {
    final response = await getIt<CatFactDio>().dio.get(
      '/facts',
      queryParameters: {'page': page},
    );
    final CatFactResponse catFactResponse =
        response.map((e) => CatFactResponse.fromJson(e)) ??
            CatFactResponse.empty();
    return CatFactMapper().map(from: catFactResponse);
  }
}
