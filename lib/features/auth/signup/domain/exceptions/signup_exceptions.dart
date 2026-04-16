import '../../../../App/exceptions/app_exception.dart';

class SignupException extends AppException {
  final String message;
  SignupException(this.message, {super.stackTrace});
}
