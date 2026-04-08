import 'package:myapp/app/app.dart';
import 'package:dartz/dartz.dart';
import '../domain.dart';

class GetListBooksUsecaseImpl
    implements Usecase<Either<AppException, List<LibraryEntity>>, void> {
  final LibraryRepository _repository;

  GetListBooksUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, List<LibraryEntity>>> call({void param}) async {
    return await _repository.getListBooks();
  }
}
