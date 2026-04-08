import 'package:myapp/features/features.dart';
import 'package:myapp/app/app.dart';

abstract class FavoriteRepository {
  Future<Either<AppException, List<FavoritEntity>>> getFavorites(int idUser);
  Future<Either<AppException, void>> removeFavorite(int favoriteId);
  //TODO: ADICIONAR FAVORITO
}
}
