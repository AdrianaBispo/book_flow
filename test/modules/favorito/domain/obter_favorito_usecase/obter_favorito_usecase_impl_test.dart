import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/modules/favoritos/domain/domain.dart';
import '../../../../../testing/fakes/fakes.dart';
import '../../../../../testing/mocks/mocks.dart';



void main() {
  late MockFavoritoRepository favoritoRepository;
  late ObterFavoritoUsecaseImpl usecase;

  setUp(() {
    favoritoRepository = MockFavoritoRepository();
    usecase = ObterFavoritoUsecaseImpl(repository: favoritoRepository);
  });
  
  test('deve retornar List<FavoritoEntity> quando for  bem-sucedida', () async {
    when(
      () => favoritoRepository.getFavorites(any()),
    ).thenAnswer((_) async => const Right(<FavoritoEntity>[]));

    final result = await usecase.call(1);
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<FavoritoEntity>>());
  });

  test('deve retornar AppException em caso de erro', () async {
    when(
      () => favoritoRepository.getFavorites(any()),
    ).thenAnswer((_) async => Left(FakeAppException()));

    final result = await usecase.call(1);

    expect(result.isLeft(), true);
  });
}
