import '../../data/dtos/signup_dto.dart';

abstract class SignupEvent {}

class SignupSubmitted extends SignupEvent {
  final SignupDto signupDto;
  SignupSubmitted(this.signupDto);
}
