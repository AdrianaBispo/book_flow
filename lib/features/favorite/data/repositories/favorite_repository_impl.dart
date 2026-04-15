import 'package:dartz/dartz.dart';
import 'package:myapp/app/app.dart';
import '../../domain/domain.dart';
import '../datasources/remote/favorite_datasource_remote.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDatasourceRemote datasource;

  FavoriteRepositoryImpl({required this.datasource});

  @override
  Future<Either<AppException, List<FavoritEntity>>> getFavorites() async {
    try {
      final result = await datasource.getFavoriteList();
      return Right(result);
    } catch (e) {
      return Left(FavoriteUnknownException());
    }
  }

  @override
  Future<Either<AppException, void>> removeFavorite(int favoriteId) async {
    try {
      await datasource.removeFavorite(favoriteId: favoriteId);
      return const Right(null);
    } catch (e) {
      return Left(FavoriteUnknownException());
    }
  }

  @override
  Future<Either<AppException, int>> addFavorite(int favoriteId) async {
    try {
      int favoritId = await datasource.addFavorite(ebookId: favoriteId);
      return Right(favoritId);
    } catch (e) {
      return Left(FavoriteUnknownException());
    }
  }

  @override
  Future<Either<AppException, bool>> isFavorite(int ebookId) async {
    try {
      bool isFav = await datasource.isFavorite(ebookId: ebookId);
      return Right(isFav);
    } catch (e) {
      return Left(FavoriteUnknownException());
    }
  }
}
