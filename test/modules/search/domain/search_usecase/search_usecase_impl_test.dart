import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/modules/search/domain/domain.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

class FakeResultSearchEntity extends ResultSearchEntity {
  FakeResultSearchEntity()
    : super(
        id: 1,
        author: 'Author',
        title: 'Title',
        cover_url: null,
        download_url: null,
      );
}

void main() {
  late MockSearchRepository searchRepository;
  late SearchUsecaseImpl usecase;
  late FakeResultSearchEntity expectedResult;

  setUp(() {
    searchRepository = MockSearchRepository();
    usecase = SearchUsecaseImpl(searchRepository);
    expectedResult = FakeResultSearchEntity();
  });

  group('SearchUsecaseImpl', () {
    test(
      'deve retornar uma lista de ResultSearchEntity quando a busca for bem-sucedida',
      () async {
        // arrange
        when(
          () => searchRepository.search(any()),
        ).thenAnswer((_) async => Right([expectedResult]));

        // act
        final result = await usecase('flutter');

        // assert
        expect(result.isRight(), true);
        expect(result.getOrElse(() => []), isA<List<ResultSearchEntity>>());
        expect(result.getOrElse(() => [])[0].title, equals('Title'));
        verify(() => searchRepository.search('flutter')).called(1);
        verifyNoMoreInteractions(searchRepository);
      },
    );

    test('deve retornar AppException quando ocorrer erro na busca', () async {
      // arrange
      final exception = NetworkException(message: 'Erro na busca');
      when(
        () => searchRepository.search(any()),
      ).thenAnswer((_) async => Left(exception));

      // act
      final result = await usecase('flutter');

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error.message, equals('Erro na busca')),
        (_) => fail('Deveria retornar Left(AppException)'),
      );
      verify(() => searchRepository.search('flutter')).called(1);
      verifyNoMoreInteractions(searchRepository);
    });
  });
}
