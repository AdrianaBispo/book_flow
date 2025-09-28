import 'package:myapp/modules/modules.dart';
import 'package:myapp/modules/login/login.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasouceRemote dataSource;

  LoginRepositoryImpl({required this.dataSource});

  @override
  Future<Either<ErrorLogin, UserLoginEntity>> loginWithEmailAndPassword(
    UserLoginEntity login,
  ) async {
    try {
      final AuthResponse user = await dataSource.login(
        loginDto: login as dynamic,
      );
      final UserLoginEntity useData = LoginDto.fromMap(user.user!.toJson());
      return Right(useData);
    } on AuthException catch (e) {
      switch (e.message.toLowerCase()) {
        case 'invalid login credentials':
          return Left(
            InvalidCredentialsError(message: 'E-mail ou senha incorretos.'),
          );
        case 'email not confirmed':
          return Left(
            EmailNotConfirmedError(
              message: 'Confirme seu e-mail antes de continuar.',
            ),
          );
        default:
          return Left(
            InvalidCredentialsError(
              message: 'Erro de autenticação: ${e.message}',
            ),
          );
      }
    } on PostgrestException catch (e) {
      return Left(
        DatabaseError(message: 'Erro no banco de dados: ${e.message}'),
      );
    } on Exception catch (e) {
      return Left(
        UnknownLoginError(message: 'Erro inesperado: ${e.toString()}'),
      );
    }
  }
}
