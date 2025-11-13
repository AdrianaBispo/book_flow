import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/utils.dart';

abstract class FavoriteRepository {
  Future<Either<AppException, List<FavoritEntity>>> getFavorites(int idUser);
  Future<Either<AppException, void>> removeFavorite(int favoriteId);
}