abstract class UseCase<T, R> {
  Future<R> invoke(T request);
}
