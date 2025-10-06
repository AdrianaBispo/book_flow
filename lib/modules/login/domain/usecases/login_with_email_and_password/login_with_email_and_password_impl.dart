import 'package:myapp/modules/modules.dart';
import '../../domain.dart';
import 'package:myapp/utils/utils.dart';

class LoginWithEmailAndPasswordImpl implements LoginWithEmailAndPassword {
  final LoginRepository _repository;

  LoginWithEmailAndPasswordImpl(this._repository);

  @override
  Future<Either<AppException, UserLoginEntity>> call(UserLoginEntity login) async{
    return await _repository.loginWithEmailAndPassword(login);
  }
}