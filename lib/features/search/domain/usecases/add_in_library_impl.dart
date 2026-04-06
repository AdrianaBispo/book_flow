import 'package:myapp/core/core.dart';
import 'package:myapp/modules/modules.dart';

class AddInLibraryUsecaseImpl implements Usecase<Either<AppException, void>> {
  final SearchRepository _repository;

  AddInLibraryUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, void>> call(
      int bookId) async {
    return await _repository.addInLibrary(bookId);
  }
}