import 'package:myapp/modules/login/domain/entities/user_login_entity.dart';

class LoginDto extends UserLoginEntity {
  String? email;
  String? password;

  LoginDto({required this.email, required this.password})
    : super(email: email, password: password);

  LoginDto.fromMap(Map<String, dynamic> map)
    : email = map['email'],
      password = map['password'],
      super(email: map['email'], password: map['password']);

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }
}
