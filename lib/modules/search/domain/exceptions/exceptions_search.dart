import 'package:myapp/core/utils/utils.dart';

class ServerCredentialsException extends AppException {
  ServerCredentialsException({super.stackTrace});
}

class NetworkSearchException extends AppException {
  NetworkSearchException({super.stackTrace});
}

class UnknownSearchException extends AppException {
  UnknownSearchException({super.stackTrace});
}

class DatabaseSearchException extends AppException {
  DatabaseSearchException({super.stackTrace});
}

class PostgrestSearchException extends AppException {
  PostgrestSearchException({super.stackTrace});
}
