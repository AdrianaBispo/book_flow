import 'package:myapp/app/app.dart';
import '../../../../../shared/shared.dart';
import '../../login.dart';


abstract class LoginRepository {
  Future<Either<AppException, void>> loginWithEmailAndPassword(
    UserLoginEntity? login
  );
}
