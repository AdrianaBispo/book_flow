import 'package:myapp/app/app.dart';
import '../domain.dart';

class AddInLibraryUsecaseImpl
    implements Usecase<Either<AppException, void>, int> {
  final SearchRepository _repository;

  AddInLibraryUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, void>> call({int? param}) async {
    return await _repository.addInLibrary(param!);
  }
}
