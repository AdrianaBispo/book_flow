import 'package:dartz/dartz.dart';
import '../../../../../App/exceptions/app_exception.dart';
import '../../data/dtos/signup_dto.dart';
import '../repositories/signup_repository.dart';

abstract class SignupWithEmailAndPassword {
  Future<Either<AppException, void>> call({required SignupDto signupDto});
}

class SignupWithEmailAndPasswordImpl implements SignupWithEmailAndPassword {
  final SignupRepository repository;

  SignupWithEmailAndPasswordImpl(this.repository);

  @override
  Future<Either<AppException, void>> call({required SignupDto signupDto}) {
    return repository.signupWithEmailAndPassword(signupDto: signupDto);
  }
}
