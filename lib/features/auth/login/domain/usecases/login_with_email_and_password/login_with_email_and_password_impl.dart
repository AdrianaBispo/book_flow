import 'package:myapp/app/app.dart';

import '../../../../../../shared/shared.dart';
import '../../../login.dart';


class LoginWithEmailAndPasswordImpl
    implements Usecase<Either, UserLoginEntity> {

  final LoginRepository _repository;

  LoginWithEmailAndPasswordImpl(this._repository);

  @override
Future<Either<AppException, void>> call({UserLoginEntity? param}) async{
   return await _repository.loginWithEmailAndPassword(param);
  }
}