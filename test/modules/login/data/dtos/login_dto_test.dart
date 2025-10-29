import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/modules/login/data/data.dart';

void main() {
  late LoginDto loginDto;
  setUp(() {
    loginDto = LoginDto(email: 'teste@gmail.com', password: '123456');
  });

  test('deve retornar Map', () {
    final result = loginDto.toMap();
    expect(result, {'email': 'teste@gmail.com', 'password': '123456'});
  });

  test('deve retornar LoginDto a partir de um Map', () {
    final result = LoginDto.fromMap({
      'email': 'teste@gmail.com',
      'password': '123456',
    });

    expect(result.runtimeType, LoginDto);
    expect(result.password, '123456');
    expect(result.email, 'teste@gmail.com');
  });
}
