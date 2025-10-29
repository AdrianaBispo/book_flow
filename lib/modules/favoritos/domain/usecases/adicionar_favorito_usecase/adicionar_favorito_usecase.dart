import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/utils.dart';

abstract class AddFavoriteUsecase {
  Future<Either<AppException, void>> call(FavoritoEntity favorite, int idUser);
}