import 'package:myapp/modules/modules.dart';
import 'package:myapp/core/utils/utils.dart';

class LoginWithEmailAndPasswordImpl implements Usecase<Either, void>  {
  final LoginRepository _repository;

  LoginWithEmailAndPasswordImpl(this._repository);

  @override
  Future<Either<AppException, void>> call(UserLoginEntity login) async{
    return await _repository.loginWithEmailAndPassword(login);
  }
}