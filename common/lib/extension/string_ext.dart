extension NullableStringExt on String? {
  String orEmpty() {
    return this ?? '';
  }
}

extension DioErrorMessage on String {
  String shortenDioErrorMessage() {
    try {
      if (startsWith('DioError [')) {
        final prefixEndIndex = indexOf(']:');
        final errorMessage =
            prefixEndIndex != -1 ? substring(prefixEndIndex + 3) : this;
        return errorMessage;
      } else {
        return this;
      }
    } on Exception {
      return '';
    }
  }
}
