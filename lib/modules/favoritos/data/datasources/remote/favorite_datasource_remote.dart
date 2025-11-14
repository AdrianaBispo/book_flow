import 'package:myapp/modules/favoritos/data/dtos/dtos.dart';

abstract class FavoriteDatasourceRemote {
  Future<List<FavoritoDto>> getFavoriteList({required int idUser});
  Future<void> removeFavorite({required int favoriteId, required int idUser});
}