abstract class ErrorLogin implements Exception {
  final String? message;
  ErrorLogin(this.message);
}

/*class LoginError implements ErrroLogin {
  final String message;
  LoginError({required this.message}): super();

}*/

class InvalidCredentialsError implements ErrorLogin {
  @override
  String? message;
  InvalidCredentialsError({required this.message});
}

class UnknownLoginError implements ErrorLogin {
  @override
  String? message;
  UnknownLoginError({required this.message});
}

class DatabaseError implements ErrorLogin {
  @override
  String? message;
  DatabaseError({required this.message});
}

class EmailNotConfirmedError  implements ErrorLogin {
  @override
  String? message;
  EmailNotConfirmedError({required this.message});
}
