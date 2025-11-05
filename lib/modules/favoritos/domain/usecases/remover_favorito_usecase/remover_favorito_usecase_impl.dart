import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/utils.dart';
import 'remover_favorito_usecase.dart';

class RemoverFavoritoUsecaseImpl implements RemoverFavoritoUsecase {
  final FavoritesRepository repository;

  RemoverFavoritoUsecaseImpl({required this.repository});

  @override
  Future<Either<AppException, void>> call(int favoriteId) async{
    return await repository.removerFavorito(favoriteId);
  }
}