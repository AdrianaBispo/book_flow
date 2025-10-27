import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/utils.dart';

abstract class LoginWithEmailAndPassword {
  Future<Either<AppException,void>> call(UserLoginEntity login);
}