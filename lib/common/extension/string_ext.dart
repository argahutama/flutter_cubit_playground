extension NullableStringExt on String? {
  String orEmpty() {
    return this ?? "";
  }
}
