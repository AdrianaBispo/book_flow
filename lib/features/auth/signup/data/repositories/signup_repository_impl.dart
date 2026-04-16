import 'package:dartz/dartz.dart';
import '../../../../App/exceptions/app_exception.dart';
import '../datasources/remote/signup_datasource_remote.dart';
import '../dtos/signup_dto.dart';
import '../../domain/repositories/signup_repository.dart';
import '../../domain/exceptions/signup_exceptions.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupDatasourceRemote datasource;

  SignupRepositoryImpl({required this.datasource});

  @override
  Future<Either<AppException, void>> signupWithEmailAndPassword({
    required SignupDto signupDto,
  }) async {
    try {
      await datasource.signup(signupDto: signupDto);
      return const Right(null);
    } catch (e, s) {
      return Left(SignupException(e.toString(), stackTrace: s));
    }
  }
}
