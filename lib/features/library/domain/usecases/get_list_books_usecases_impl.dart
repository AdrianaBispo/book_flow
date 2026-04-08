
class GetListBooksUsecaseImpl implements Usecase<Either<AppException, List<LibraryEntity>>> {
  final LibraryRepository _repository;

  GetListBooksUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, List<LibraryEntity>>> call() async {
    return await _repository.getListBooks();
  }
}