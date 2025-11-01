import 'package:myapp/utils/utils.dart';

class ServerCredentialsException extends AppException {
  ServerCredentialsException({required super.message, super.stackTrace});
}

class NetworkSearchException extends AppException {
  NetworkSearchException({required super.message, super.stackTrace});
}

class UnknownSearchException extends AppException {
  UnknownSearchException({required super.message, super.stackTrace});
}

class DatabaseSearchException extends AppException {
  DatabaseSearchException({required super.message, super.stackTrace});
}

class PostgrestSearchException extends AppException {
  PostgrestSearchException({required super.message, super.stackTrace});
}
