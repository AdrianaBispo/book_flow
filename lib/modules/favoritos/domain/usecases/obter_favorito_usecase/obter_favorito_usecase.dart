import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/utils.dart';

abstract class ObterFavoritoUsecase {
  Future<Either<AppException, void>> call(int idUser);
}