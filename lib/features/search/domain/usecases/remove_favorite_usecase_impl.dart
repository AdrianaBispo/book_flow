import 'package:myapp/core/core.dart';
import 'package:myapp/modules/modules.dart';

class RemoveFavoriteUsecaseImpl implements Usecase<Either<AppException, void>> {
  final SearchRepository _repository;

  RemoveFavoriteUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, void>> call(
      int favoriteId) async {
    return await _repository.removeFavorite(favoriteId);
  }
} 