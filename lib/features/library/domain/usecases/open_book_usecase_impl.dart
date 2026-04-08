import 'package:dartz/dartz.dart';
import 'package:myapp/app/app.dart';
import '../domain.dart';

class OpenBookUsecaseImpl
    implements Usecase<Either<AppException, void>, String> {
  final LibraryRepository _repository;

  OpenBookUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, void>> call({String? param}) async {
    return await _repository.openBook(param!);
  }
}
