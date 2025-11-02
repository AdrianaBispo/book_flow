import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:myapp/modules/login/login.dart';

class MockLoginRepository extends Mock implements LoginRepositoryImpl {}

class FakeLoginDto extends Fake implements LoginDto {}

void main() {
  late LoginBloc loginBloc;
  late MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    loginBloc = LoginBloc(mockLoginRepository);
  });

  setUpAll(() {
    registerFallbackValue(FakeLoginDto());
  });

  tearDown(() {
    loginBloc.close();
  });
  test('initial state deve ser LoginState', () {
    expect(loginBloc.state, isA<LoginState>());
  });
  blocTest<LoginBloc, LoginState>(
    'Deve emit [LoginStatus.invalidCredentials] quando tentar logar as informações erradas',
    build: () => LoginBloc(mockLoginRepository),
    act: (bloc) => bloc.add(LoginSubmitted()),
    expect: () => [
      isA<LoginState>().having((s) => s.status, 'status', LoginStatus.invalidCredentials),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'Deve emitir [] quando acionar o evento LoginTogglePasswordVisibility',
    build: () => loginBloc,
    act: (bloc) => bloc.add(LoginTogglePasswordVisibility()),
    expect: () => [
      isA<LoginState>().having(
        (s) => s.isPasswordVisible,
        'isPasswordVisible',
        true,
      ),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'deve emitir estado com email atualizado quando LoginEmailChanged é adicionado',
    build: () => loginBloc,
    act: (bloc) => bloc.add(LoginEmailChanged('teste@email.com')),
    expect: () => [
      isA<LoginState>()
          .having((s) => s.email, 'email', 'teste@email.com')
          .having((s) => s.status, 'status', LoginStatus.initial),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'deve emitir estado com password atualizado quando LoginPasswordChanged é adicionado',
    build: () => loginBloc,
    act: (bloc) => bloc.add(LoginPasswordChanged('senha123')),
    expect: () => [
      isA<LoginState>()
          .having((s) => s.password, 'password', 'senha123')
          .having((s) => s.status, 'status', LoginStatus.initial),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'deve emitir [invalidCredentials] quando as credencias forem inválidas',
    build: () => loginBloc,
    act: (bloc) => bloc.add(LoginSubmitted()),
    expect: () => [
      isA<LoginState>()
          .having((s) => s.status, 'status', LoginStatus.invalidCredentials)
          .having(
            (s) => s.errorMessage,
            'errorMessage',
            'Erro ao fazer login. Tente novamente.',
          ),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'deve emitir [loading, success] quando o login for bem-sucedido',
    build: () {
      when(
        () => mockLoginRepository.loginWithEmailAndPassword(any()),
      ).thenAnswer(
        (_) async => Right(LoginDto(email: 'a@b.com', password: '123456')),
      );

      final bloc = loginBloc;
      bloc.emit(bloc.state.copyWith(email: 'a@b.com', password: '123456'));
      return bloc;
    },
    act: (bloc) => bloc.add(LoginSubmitted()),
    expect: () => [
      isA<LoginState>().having((s) => s.status, 'status', LoginStatus.loading),
      isA<LoginState>().having((s) => s.status, 'status', LoginStatus.success),
    ],
  );
}
