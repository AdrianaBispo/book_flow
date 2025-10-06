import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/utils.dart';
import '../domain.dart';

abstract class LoginRepository {
  Future<Either<AppException, UserLoginEntity>> loginWithEmailAndPassword(
    UserLoginEntity login
  );
}
