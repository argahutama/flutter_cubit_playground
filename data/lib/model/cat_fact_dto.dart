import 'package:json_annotation/json_annotation.dart';

part 'cat_fact_dto.g.dart';

@JsonSerializable()
class CatFactDto {
  @JsonKey(name: 'fact')
  String? fact;

  CatFactDto(this.fact);

  factory CatFactDto.fromJson(Map<String, dynamic> json) =>
      _$CatFactDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CatFactDtoToJson(this);
}
