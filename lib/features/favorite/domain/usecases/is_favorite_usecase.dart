import 'package:dartz/dartz.dart';
import 'package:myapp/app/app.dart';
import '../domain.dart';

class IsFavoriteUsecaseImpl
    implements Usecase<Either<AppException, bool>, int> {
  final FavoriteRepository _repository;

  IsFavoriteUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, bool>> call({int? param}) async {
    return await _repository.isFavorite(ebookId: param!);
  }
}
