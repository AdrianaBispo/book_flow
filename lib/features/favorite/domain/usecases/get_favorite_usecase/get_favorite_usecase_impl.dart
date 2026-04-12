import 'package:dartz/dartz.dart';
import 'package:myapp/app/app.dart';
import '../../domain.dart';

class GetFavoriteUsecaseImpl
    implements Usecase<Either<AppException, List<FavoritEntity>>, dynamic> {
  final FavoriteRepository repository;

  GetFavoriteUsecaseImpl({required this.repository});

  @override
  Future<Either<AppException, List<FavoritEntity>>> call({dynamic param}) async {
    return await repository.getFavorites();
  }
}
