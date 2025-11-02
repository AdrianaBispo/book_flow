import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:myapp/modules/login/domain/usecases/login_with_email_and_password/login_with_email_and_password_impl.dart';
import 'package:myapp/modules/login/login.dart';
import 'package:myapp/utils/exceptions/app_exception.dart';
import 'package:mockito/mockito.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

class FakeUserLoginEntity extends UserLoginEntity {
  FakeUserLoginEntity() : super(email: 'test@test.com', password: '123456');
}

class FakeAppException extends AppException {
  FakeAppException() : super();
}

void main() {
  late MockLoginRepository loginRepository;
  late LoginWithEmailAndPasswordImpl usecase;
  late FakeUserLoginEntity expectedLogin;

  setUpAll(() {
    loginRepository = MockLoginRepository();
    usecase = LoginWithEmailAndPasswordImpl(loginRepository);
    expectedLogin = FakeUserLoginEntity();
    registerFallbackValue(FakeUserLoginEntity());
  });

  test('deve retornar void em caso de sucesso', () async {
    when(
      () => loginRepository.loginWithEmailAndPassword(any()),
    ).thenAnswer((_) async => const Right(null));

    final result = await usecase.call(expectedLogin);

    expect(result, const Right(null));
    verify(
      () => loginRepository.loginWithEmailAndPassword(expectedLogin),
    ).called(1);
    verifyNoMoreInteractions(loginRepository);
  });

  test('deve retornar AppException em caso de erro', () async {
    when(
      () => loginRepository.loginWithEmailAndPassword(any()),
    ).thenAnswer((_) async => Left(FakeAppException()));
    final result = await usecase.call(expectedLogin);
    expect(result, isA<Left>());
    verify(
      () => loginRepository.loginWithEmailAndPassword(expectedLogin),
    ).called(1);
  });
}
