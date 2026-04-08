import 'package:dartz/dartz.dart';
import 'package:myapp/app/app.dart';
import '../domain.dart';

class RemoveBookFromLibraryUsecaseImpl
    implements Usecase<Either<AppException, void>, String> {
  final LibraryRepository _repository;

  RemoveBookFromLibraryUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, void>> call({String? param}) async {
    return await _repository.removeBookInLibrary(param!);
  }
}
