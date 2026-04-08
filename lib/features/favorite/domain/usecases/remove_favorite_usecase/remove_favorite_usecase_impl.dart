import 'package:dartz/dartz.dart';
import 'package:myapp/app/app.dart';
import '../../domain.dart';

class RemoveFavoriteUsecaseImpl
    implements Usecase<Either<AppException, void>, int> {
  final FavoriteRepository repository;

  RemoveFavoriteUsecaseImpl({required this.repository});

  @override
  Future<Either<AppException, void>> call({int? param}) async {
    return await repository.removeFavorite(param!);
  }
}
