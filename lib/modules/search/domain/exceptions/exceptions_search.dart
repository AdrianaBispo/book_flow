import 'package:myapp/utils/utils.dart';

class ServerCredentialsException extends AppException {
  ServerCredentialsException({required super.message, super.stackTrace});
}

class NetworkException extends AppException {
  NetworkException({required super.message, super.stackTrace});
}