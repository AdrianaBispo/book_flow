import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/features/favorite/domain/domain.dart';
import 'package:myapp/features/favorite/domain/usecases/remove_favorite_usecase/remove_favorite_usecase_impl.dart';

import '../../../../../testing/fakes/fakes.dart';
import '../../../../../testing/mocks/mocks.dart';


void main() {
  late MockFavoritoRepository favoritoRepository;
  late RemoveFavoriteUsecaseImpl usecase;

  setUp(() {
    favoritoRepository = MockFavoritoRepository();
    usecase = RemoveFavoriteUsecaseImpl(repository: favoritoRepository);
  });
  test('deve retornar void quando a remoção for bem-sucedida', () async {
    when(
      () => favoritoRepository.removeFavorite(any()),
    ).thenAnswer((_) async => const Right(null));

    final result = await usecase.call(param: 1);

    expect(result, Right(null));
  });

  test('deve retornar AppException em caso de erro', () async {
    when(
      () => favoritoRepository.removeFavorite(any()),
    ).thenAnswer((_) async => Left(FakeAppException()));

    final result = await usecase.call(param: 1);

    expect(result, isA<Left>());
  });
}
