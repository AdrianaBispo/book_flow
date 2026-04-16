import '../../../../App/exceptions/app_exception.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupFailure extends SignupState {
  final AppException exception;
  SignupFailure(this.exception);
}
