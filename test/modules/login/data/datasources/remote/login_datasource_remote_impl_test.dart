import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/modules/modules.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockGoTrueClient extends Mock implements GoTrueClient {}

void main() {
  late MockSupabaseClient mockSupabaseClient;
  late MockGoTrueClient mockGoTrueClient;
  late LoginDatasouceRemoteImpl datasource;
  late LoginDto userCredentials;

  setUp(() {
    mockSupabaseClient = MockSupabaseClient();
    datasource = LoginDatasouceRemoteImpl(supabaseClient: mockSupabaseClient);
    userCredentials = LoginDto(email: 'email', password: 'password');

    mockGoTrueClient = MockGoTrueClient();
    when(() => mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
  });
  group('login', () {
    test('deve retornar AuthResponse', () async {
      when(
        () => mockGoTrueClient.signInWithPassword(
          email: userCredentials.email,
          password: userCredentials.password!,
        ),
      ).thenAnswer((_) async => AuthResponse());

      final result = await datasource.login(loginDto: userCredentials);

      expect(result, isA<AuthResponse>());

      verify(
        () => mockGoTrueClient.signInWithPassword(
          email: userCredentials.email!,
          password: userCredentials.password!,
        ),
      ).called(1);
    });
    test('deve retornar um exception ao tentar logar', () async {
      when(
        () => mockSupabaseClient.auth.signInWithPassword(
          email: userCredentials.email!,
          password: userCredentials.password!,
        ),
      ).thenThrow(Exception());
      expect(
        () => datasource.login(loginDto: userCredentials),
        throwsA(isA<Exception>()),
      );
    });
  });
}
