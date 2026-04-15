import 'package:myapp/features/favorite/data/dtos/dtos.dart';

abstract class FavoriteDatasourceRemote {
  Future<List<FavoritDto>> getFavoriteList();
  Future<void> removeFavorite({required int favoriteId});
  Future<int> addFavorite({required int ebookId});
  Future<bool> isFavorite({required int ebookId});
}
