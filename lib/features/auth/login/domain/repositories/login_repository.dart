import 'package:myapp/modules/modules.dart';
import 'package:myapp/core/utils/utils.dart';

abstract class LoginRepository {
  Future<Either<AppException, void>> loginWithEmailAndPassword(
    UserLoginEntity login
  );
}
