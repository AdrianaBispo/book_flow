import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/modules/favoritos/domain/domain.dart';
import 'package:myapp/utils/utils.dart';

class MockFavoritoRepository extends Mock implements FavoritesRepository {}

class FakeAppException extends AppException {
  FakeAppException() : super();
}

void main() {
  late MockFavoritoRepository favoritoRepository;
  late RemoverFavoritoUsecaseImpl usecase;

  setUp(() {
    favoritoRepository = MockFavoritoRepository();
    usecase = RemoverFavoritoUsecaseImpl(repository: favoritoRepository);
  });
  test('deve retornar void quando a remoção for bem-sucedida', () async {
    when(
      () => favoritoRepository.removerFavorito(any()),
    ).thenAnswer((_) async => const Right(null));

    final result = await usecase.call(1);

    expect(result, Right(null));
  });

  test('deve retornar AppException em caso de erro', () async {
    when(
      () => favoritoRepository.removerFavorito(any()),
    ).thenAnswer((_) async => Left(FakeAppException()));

    final result = await usecase.call(1);

    expect(result, isA<Left>());
  });
}
