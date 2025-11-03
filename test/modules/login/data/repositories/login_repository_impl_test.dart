import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/modules/modules.dart';

class MockLoginRepositoryImpl extends Mock implements LoginRepositoryImpl {}

class MockLoginDatasourceRemote extends Mock implements LoginDatasouceRemote {}

void main() {
  late LoginRepositoryImpl repository;
  late MockLoginDatasourceRemote datasource;
  late LoginDto userCredentials;

  setUpAll(() {
    datasource = MockLoginDatasourceRemote();
    repository = LoginRepositoryImpl(dataSource: datasource);
    userCredentials = LoginDto(email: 'test@test.com', password: '123456');
    registerFallbackValue(userCredentials);
  });

  test('Deve retornar null quando sucesso', () async {
    final mockUser = User(
      id: '123',
      email: 'email@example.com',
      appMetadata: {},
      userMetadata: {},
      aud: '',
      createdAt: '',
    );
    when(
      () => datasource.login(loginDto: userCredentials),
    ).thenAnswer((_) async => AuthResponse(user: mockUser));

    final result = await repository.loginWithEmailAndPassword(userCredentials);

    expect(result.isRight(), true);
  });
  test(
    'Deve retornar Left(AppException) quando o datasource lançar erro',
    () async {
      when(
        () => datasource.login(loginDto: any(named: 'loginDto')),
      ).thenThrow(AuthException('invalid login credentials'));

      final result = await repository.loginWithEmailAndPassword(
        userCredentials,
      );

      expect(result.isLeft(), true);
      expect(
        result.fold((l) => l, (_) => null),
        isA<InvalidCredentialsException>(),
      );
    },
  );
}
