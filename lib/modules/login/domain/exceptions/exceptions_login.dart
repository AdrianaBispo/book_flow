import 'package:myapp/core/core.dart';

class InvalidCredentialsException extends AppException {
  InvalidCredentialsException({required super.message, super.stackTrace});
}

class UnknownLoginException extends AppException {
  UnknownLoginException({required super.message, super.stackTrace});
}

class DatabaseException extends AppException {
  DatabaseException({required super.message, super.stackTrace});
}

class EmailNotConfirmedException extends AppException {
  EmailNotConfirmedException({required super.message, super.stackTrace});
}
