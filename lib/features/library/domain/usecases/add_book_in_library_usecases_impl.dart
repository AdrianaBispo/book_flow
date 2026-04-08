import 'package:myapp/core/core.dart';
import 'package:myapp/modules/modules.dart';

class AddBookInLibraryUsecaseImpl implements Usecase<Either<AppException, void>> {
  final LibraryRepository _repository;

  AddBookInLibraryUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, void>> call(String id) async {
    return await _repository.addBookInLibrary(id);
  }
}