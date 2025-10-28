import 'package:myapp/utils/utils.dart';

class ServerCredentialsException extends AppException {
  ServerCredentialsException({required super.message, super.stackTrace});
}

class NetworkException extends AppException {
  NetworkException({required super.message, super.stackTrace});
}

class UnknownSearchException extends AppException {
  UnknownSearchException({required super.message, super.stackTrace});
}

class DatabaseException extends AppException {
  DatabaseException({required super.message, super.stackTrace});
}
