import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/utils.dart';
import 'obter_favorito_usecase.dart';

class ObterFavoritoUsecaseImpl implements ObterFavoritoUsecase {
  final FavoriteRepository repository;

  ObterFavoritoUsecaseImpl({required this.repository});

  @override
  Future<Either<AppException, List<FavoritEntity>>> call(int idUser) async{
    return await repository.getFavorites(idUser);
  }
}