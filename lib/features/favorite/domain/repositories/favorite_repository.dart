import 'package:myapp/features/features.dart';
import 'package:myapp/app/app.dart';

abstract class FavoriteRepository {
  Future<Either<AppException, List<FavoritEntity>>> getFavorites();
  Future<Either<AppException, void>> removeFavorite(int favoriteId);
  Future<Either<AppException, void>> addFavorite(int favoriteId);
}
