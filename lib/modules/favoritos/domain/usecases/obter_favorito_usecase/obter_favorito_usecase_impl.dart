import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/utils.dart';
import 'obter_favorito_usecase.dart';

class ObterFavoritoUsecaseImpl implements ObterFavoritoUsecase {
  final FavoritesRepository repository;

  ObterFavoritoUsecaseImpl({required this.repository});

  @override
  Future<Either<AppException, List<FavoritoEntity>>> call(int idUser) {
    return repository.getFavorites(idUser);
  }
}