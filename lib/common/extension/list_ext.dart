extension NullableListExt<T> on List<T>? {
  List<T> orEmpty() {
    return this ?? <T>[];
  }
}

extension ListExt<T> on List<T> {
  List<R> mapToList<R>(R Function(T) f) {
    return map(f).toList();
  }
}
