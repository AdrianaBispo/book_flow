import 'package:myapp/utils/utils.dart';
import 'package:myapp/modules/modules.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasouceRemote dataSource;

  LoginRepositoryImpl({required this.dataSource});

  @override
  Future<Either<AppException, void>> loginWithEmailAndPassword(
    UserLoginEntity login,
  ) async {
    try {
      await dataSource.login(
        loginDto: login as dynamic,
      );
      return Right(null);
    } on AuthException catch (e) {
      switch (e.message.toLowerCase()) {
        case 'invalid login credentials':
          return Left(
            InvalidCredentialsException(message: 'E-mail ou senha incorretos.'),
          );
        case 'email not confirmed':
          return Left(
            EmailNotConfirmedException(
              message: 'Confirme seu e-mail antes de continuar.',
            ),
          );
        default:
          return Left(
            InvalidCredentialsException(
              message: 'Erro de autenticação: ${e.message}',
            ),
          );
      }
    } on PostgrestException catch (e) {
      return Left(
        DatabaseException(message: 'Erro no banco de dados: ${e.message}'),
      );
    } on Exception catch (e) {
      return Left(
        UnknownLoginException(message: 'Erro inesperado: ${e.toString()}'),
      );
    }
  }
}
