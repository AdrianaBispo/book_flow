import 'package:dartz/dartz.dart';
import 'package:myapp/app/app.dart';
import '../../domain/domain.dart';
import '../datasources/remote/favorite_datasource_remote.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDatasourceRemote datasource;

  FavoriteRepositoryImpl({required this.datasource});

  @override
  Future<Either<AppException, List<FavoritEntity>>> getFavorites(int idUser) async {
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
  Future<Either<AppException, void>> addFavorite(int favoriteId) async {
    try {
      await datasource.addFavorite(favoriteId: favoriteId);
      return const Right(null);
    } catch (e) {
      return Left(FavoriteUnknownException());
    }
  }
}
