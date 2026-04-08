import 'package:myapp/app/exceptions/app_exception.dart';

class InvalidCredentialsException extends AppException {
  InvalidCredentialsException({super.stackTrace});
}

class UnknownLoginException extends AppException {
  UnknownLoginException({super.stackTrace});
}

class DatabaseException extends AppException {
  DatabaseException({super.stackTrace});
}

class EmailNotConfirmedException extends AppException {
  EmailNotConfirmedException({super.stackTrace});
}
