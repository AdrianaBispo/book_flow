import 'package:dartz/dartz.dart';
import '../domain.dart';

abstract class LoginRepository {
  Future<Either<ErrorLogin, UserLoginEntity>> loginWithEmailAndPassword(
    UserLoginEntity login
  );
}
