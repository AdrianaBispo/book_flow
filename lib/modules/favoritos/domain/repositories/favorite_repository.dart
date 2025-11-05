import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/utils.dart';

abstract class FavoritesRepository {
  Future<Either<AppException, List<FavoritoEntity>>> getFavorites(int favoriteId);
  Future<Either<AppException, void>> removerFavorito(int favoriteId);
}