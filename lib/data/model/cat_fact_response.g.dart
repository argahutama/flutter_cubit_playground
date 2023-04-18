// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatFactResponse _$CatFactResponseFromJson(Map<String, dynamic> json) =>
    CatFactResponse(
      json['current_page'] as int?,
      json['per_page'] as int?,
      json['total'] as int?,
      json['next_page_url'] as String?,
      json['prev_page_url'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => CatFactDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CatFactResponseToJson(CatFactResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'next_page_url': instance.nextPageUrl,
      'prev_page_url': instance.prevPageUrl,
      'data': instance.data,
    };
