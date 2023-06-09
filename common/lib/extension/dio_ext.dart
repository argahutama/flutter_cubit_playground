import 'dart:convert';

import 'package:dio/dio.dart';

extension DioExt on Response {
  bool isSuccessful() {
    if (statusCode == null) return false;
    return statusCode! >= 200 && statusCode! < 300;
  }

  T? map<T>(T Function(dynamic json) fromJson) {
    try {
      if (isSuccessful()) {
        final data = json.decode(this.data);
        if (data is List) {
          return data.map((e) => fromJson(e)).toList() as T;
        } else if (data is Map<String, dynamic>) {
          return fromJson(data);
        }
      }
    } on TypeError {
      return null;
    }
    throw DioError(
      requestOptions: requestOptions,
      response: this,
    );
  }
}
