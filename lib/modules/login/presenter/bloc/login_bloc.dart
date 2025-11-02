import '../../../modules.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository) : super(LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginTogglePasswordVisibility>(_onTogglePasswordVisibility);
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email, status: LoginStatus.initial));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password, status: LoginStatus.initial));
  }

  void _onTogglePasswordVisibility(
    LoginTogglePasswordVisibility event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.isFormValid) return;
    emit(state.copyWith(status: LoginStatus.loading));

    final result = await loginRepository.loginWithEmailAndPassword(
      LoginDto(email: state.email, password: state.password),
    );
    result.fold(
      (l) {
        if (l is InvalidCredentialsException) {
          emit(state.copyWith(status: LoginStatus.invalidCredentials));
        } else if (l is EmailNotConfirmedException) {
          emit(state.copyWith(status: LoginStatus.emailNotConfirmed));
        } else if (l is DatabaseException) {
          emit(state.copyWith(status: LoginStatus.databaseError));
        } else {
          emit(state.copyWith(status: LoginStatus.unknownError));
        }
      },
      (r) {
        emit(state.copyWith(status: LoginStatus.success));
      },
    );
  }
}
