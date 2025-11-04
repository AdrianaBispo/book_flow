import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/utils.dart';

abstract class RemoverFavoritoUsecase {
  Future<Either<AppException, void>> call(int favoriteId);
}