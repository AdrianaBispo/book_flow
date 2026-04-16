import 'package:dartz/dartz.dart';
import 'package:myapp/app/app.dart';
import '../domain.dart';

class AddBookInLibraryUsecaseImpl
    implements Usecase<Either<AppException, void>, LibraryEntity> {
  final LibraryRepository _repository;

  AddBookInLibraryUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, void>> call({LibraryEntity? param}) async {
    return await _repository.addBookInLibrary(param!);
  }
}
