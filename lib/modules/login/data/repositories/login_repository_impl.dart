import 'package:myapp/utils/utils.dart';
import 'package:myapp/modules/modules.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasouceRemote dataSource;

  LoginRepositoryImpl({required this.dataSource});

  @override
  Future<Either<AppException, UserLoginEntity>> loginWithEmailAndPassword(
    UserLoginEntity login,
  ) async {
    try {
      final AuthResponse user = await dataSource.login(
        loginDto: login as dynamic,
      );
      final UserLoginEntity useData = LoginDto.fromMap(user.user!.toJson());
      return Right(useData);
    } on AuthException catch (e, s) {
      switch (e.message.toLowerCase()) {
        case 'invalid login credentials':
          return Left(InvalidCredentialsException(stackTrace: s));
        case 'email not confirmed':
          return Left(EmailNotConfirmedException(stackTrace: s));
        default:
          return Left(InvalidCredentialsException(stackTrace: s));
      }
    } on PostgrestException {
      return Left(DatabaseException());
    } on Exception{
      return Left(UnknownLoginException());
    }
  }
}
