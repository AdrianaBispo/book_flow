import 'package:myapp/modules/modules.dart';
import 'package:myapp/core/utils/utils.dart';

abstract class GetFavoriteUsecase {
  Future<Either<AppException, void>> call(int idUser);
}