import 'package:myapp/modules/modules.dart';
import 'package:myapp/core/core.dart';
import '../domain.dart';

abstract class LoginRepository {
  Future<Either<AppException, UserLoginEntity>> loginWithEmailAndPassword(
    UserLoginEntity login
  );
}
