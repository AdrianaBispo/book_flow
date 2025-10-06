import 'package:myapp/modules/modules.dart';
import '../../domain.dart';
import 'package:myapp/utils/utils.dart';

abstract class LoginWithEmailAndPassword {
  Future<Either<AppException,UserLoginEntity>> call(UserLoginEntity login);
}