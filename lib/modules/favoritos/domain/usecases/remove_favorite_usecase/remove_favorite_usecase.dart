import 'package:myapp/modules/modules.dart';
import 'package:myapp/core/utils/utils.dart';

abstract class RemoveFavoriteUsecase {
  Future<Either<AppException, void>> call(int favoriteId);
}