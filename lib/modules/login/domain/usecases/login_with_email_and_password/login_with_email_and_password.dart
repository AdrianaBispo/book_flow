import 'package:myapp/modules/modules.dart';
import '../../domain.dart';
import 'package:myapp/core/core.dart';

abstract class LoginWithEmailAndPassword {
  Future<Either<AppException,UserLoginEntity>> call(UserLoginEntity login);
}