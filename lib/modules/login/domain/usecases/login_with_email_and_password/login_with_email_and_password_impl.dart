import 'package:dartz/dartz.dart';
import '../../domain.dart';

class LoginWithEmailAndPasswordImpl implements LoginWithEmailAndPassword {
  final LoginRepository _repository;

  LoginWithEmailAndPasswordImpl(this._repository);

  @override
  Future<Either<ErrorLogin, UserLoginEntity>> call(UserLoginEntity login) async{
    return await _repository.loginWithEmailAndPassword(login);
  }
}