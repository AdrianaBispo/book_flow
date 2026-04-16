import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/signup_with_email_and_password.dart';
import '../events/signup_event.dart';
import '../states/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupWithEmailAndPassword usecase;

  SignupBloc({required this.usecase}) : super(SignupInitial()) {
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  Future<void> _onSignupSubmitted(
    SignupSubmitted event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    final result = await usecase(
      signupDto: event.signupDto,
    );
    result.fold(
      (exception) => emit(SignupFailure(exception)),
      (_) => emit(SignupSuccess()),
    );
  }
}
