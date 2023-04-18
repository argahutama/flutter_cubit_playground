import 'package:dio/dio.dart';

extension DioExt on Response {
  bool isSuccessful() {
    if (statusCode == null) return false;
    return statusCode! >= 200 && statusCode! < 300;
  }

  T map<T>(T Function(dynamic json) fromJson) {
    if (isSuccessful()) {
      final data = this.data;
      if (data is List) {
        return data.map((e) => fromJson(e)).toList() as T;
      } else if (data is Map<String, dynamic>) {
        return fromJson(data);
      }
    }
    throw DioError(
      requestOptions: requestOptions,
      response: this,
    );
  }
}
