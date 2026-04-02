import 'package:myapp/modules/favoritos/data/dtos/dtos.dart';

abstract class FavoriteDatasourceRemote {
  Future<List<FavoritoDto>> getFavoriteList();
  Future<void> removeFavorite({required int favoriteId});
}