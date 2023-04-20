import 'package:json_annotation/json_annotation.dart';

import 'cat_fact_dto.dart';

part 'cat_fact_response.g.dart';

@JsonSerializable()
class CatFactResponse {
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'per_page')
  int? perPage;
  @JsonKey(name: 'total')
  int? total;
  @JsonKey(name: 'next_page_url')
  String? nextPageUrl;
  @JsonKey(name: 'prev_page_url')
  String? prevPageUrl;
  @JsonKey(name: 'data')
  List<CatFactDto>? data;

  CatFactResponse(
    this.currentPage,
    this.perPage,
    this.total,
    this.nextPageUrl,
    this.prevPageUrl,
    this.data,
  );

  factory CatFactResponse.empty() =>
      CatFactResponse(null, null, null, null, null, null);

  factory CatFactResponse.fromJson(Map<String, dynamic> json) =>
      _$CatFactResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CatFactResponseToJson(this);
}
