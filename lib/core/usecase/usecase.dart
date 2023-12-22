///[Future].
abstract mixin class UseCase<T, Params> {
  Future<T> call(Params params);
}

///[Future].
abstract mixin class NoParamUseCase<T> {
  Future<T?> call();
}

///[Streams].
abstract mixin class StreamUseCase<T, Params> {
  Stream<T> call(Params params);
}
