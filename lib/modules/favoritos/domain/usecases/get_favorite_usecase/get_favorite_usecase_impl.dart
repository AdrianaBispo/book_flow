import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/utils.dart';
import 'get_favorite_usecase.dart';

class GetFavoriteUsecaseImpl implements GetFavoriteUsecase {
  final FavoriteRepository repository;

  GetFavoriteUsecaseImpl({required this.repository});

  @override
  Future<Either<AppException, List<FavoritEntity>>> call(int idUser) async{
    return await repository.getFavorites(idUser);
  }
}