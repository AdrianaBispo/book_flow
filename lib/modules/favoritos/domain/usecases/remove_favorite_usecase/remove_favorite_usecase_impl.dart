import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/utils.dart';
import 'remove_favorite_usecase.dart';

class RemoveFavoriteUsecaseImpl implements RemoveFavoriteUsecase {
  final FavoriteRepository repository;

  RemoveFavoriteUsecaseImpl({required this.repository});

  @override
  Future<Either<AppException, void>> call(int favoriteId) async{
    return await repository.removeFavorite(favoriteId);
  }
}