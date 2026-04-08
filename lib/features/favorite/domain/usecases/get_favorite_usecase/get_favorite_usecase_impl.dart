import 'package:dartz/dartz.dart';
import 'package:myapp/app/app.dart';
import '../../domain.dart';

class GetFavoriteUsecaseImpl
    implements Usecase<Either<AppException, List<FavoritEntity>>, int> {
  final FavoriteRepository repository;

  GetFavoriteUsecaseImpl({required this.repository});

  @override
  Future<Either<AppException, List<FavoritEntity>>> call({int? param}) async {
    return await repository.getFavorites(param!);
  }
}
