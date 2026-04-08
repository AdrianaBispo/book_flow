import 'package:dartz/dartz.dart';
import 'package:myapp/app/app.dart';
import '../domain.dart';

class AddFavoriteUsecaseImpl
    implements Usecase<Either<AppException, void>, int> {
  final FavoriteRepository _repository;

  AddFavoriteUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, void>> call({int? param}) async {
    return await _repository.addFavorite(param!);
  }
}
