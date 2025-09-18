
enum LoginStatus { initial, loading, success, failure }

class LoginState {
  const LoginState({
    this.status = LoginStatus.initial,
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.errorMessage,
  });

  final LoginStatus status;
  final String email;
  final String password;
  final bool isPasswordVisible;
  final String? errorMessage;

  bool get isEmailValid => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  bool get isPasswordValid => password.length >= 6;
  bool get isFormValid => isEmailValid && isPasswordValid;

  LoginState copyWith({
    LoginStatus? status,
    String? email,
    String? password,
    bool? isPasswordVisible,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
