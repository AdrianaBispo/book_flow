import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/utils.dart';

abstract class RemoverFavorito {
  Future<Either<AppException, void>> call(String favoriteId);
}