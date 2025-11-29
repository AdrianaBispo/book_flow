import 'package:myapp/modules/modules.dart';
import 'package:myapp/core/utils/utils.dart';

abstract class LoginWithEmailAndPassword {
  Future<Either<AppException,void>> call(UserLoginEntity login);
}