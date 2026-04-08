import '../../domain/domain.dart';

class LoginDto extends UserLoginEntity {
  LoginDto({required super.email, required super.password});

  LoginDto.fromJson(Map<String, dynamic> map)
    : super(email: map['email'], password: map['password']);

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
