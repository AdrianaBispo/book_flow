import 'package:myapp/core/core.dart';
import '../repositories/library_repository.dart';

class OpenBookUsecaseImpl implements Usecase<Either<AppException, void>> {
  final LibraryRepository _repository;

  OpenBookUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, void>> call(String path) async {
    return await _repository.openBook(path);
  }
}
