abstract class Usecase<T, Param> {
  Future<T> call({Param param});
}
