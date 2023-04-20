import 'package:json_annotation/json_annotation.dart';

part 'network_error.g.dart';

@JsonSerializable()
class NetworkError {
  @JsonKey(name: 'code')
  int? code;
  @JsonKey(name: 'message')
  String? message;

  NetworkError(this.code, this.message);

  factory NetworkError.fromJson(Map<String, dynamic> json) =>
      _$NetworkErrorFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkErrorToJson(this);
}
