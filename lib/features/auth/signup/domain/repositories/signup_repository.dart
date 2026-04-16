import 'package:dartz/dartz.dart';
import '../../../../App/exceptions/app_exception.dart';
import '../../data/dtos/signup_dto.dart';

abstract class SignupRepository {
  Future<Either<AppException, void>> signupWithEmailAndPassword({
    required SignupDto signupDto,
  });
}
