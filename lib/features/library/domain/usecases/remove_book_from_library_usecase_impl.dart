import 'package:myapp/core/core.dart';
import 'package:myapp/features/library/domain/domain.dart';

class RemoveBookFromLibraryUsecaseImpl implements Usecase<Either<AppException, void>> {
  final LibraryRepository _repository;

  RemoveBookFromLibraryUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, void>> call(String id) async {
    return await _repository.removeBookInLibrary(id);
  }
}
