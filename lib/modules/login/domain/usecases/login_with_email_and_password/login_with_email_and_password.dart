import 'package:myapp/modules/login/domain/entities/user_login_entity.dart';

import '../../error/error_login.dart';
import 'package:dartz/dartz.dart';
abstract class LoginWithEmailAndPassword {
  Future<Either<ErrorLogin,UserLoginEntity>> call(UserLoginEntity login);
}