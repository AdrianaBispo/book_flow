import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/modules/modules.dart';

class MockSearchDatasourceRemote extends Mock
    implements SearchDatasourceRemote {}

void main() {
  late SearchRepositoryImpl repository;
  late MockSearchDatasourceRemote mockDatasource;

  setUp(() {
    mockDatasource = MockSearchDatasourceRemote();
    repository = SearchRepositoryImpl(dataSource: mockDatasource);
  });

  const searchText = 'flutter';

  final mockDtoList = [
    ResultSearchDto(
      id: 1,
      title: 'Flutter Dev',
      author: '',
    ),
  ];

  group('SearchRepositoryImpl', () {
    test( 
      'Deve retornar Right(List<ResultSearchEntity>) quando a busca for bem-sucedida',
      () async {
        // Arrange
        when(
          () => mockDatasource.search(searchText),
        ).thenAnswer((_) async => mockDtoList);

        // Act
        final result = await repository.search(searchText);

        // Assert
        expect(result.isRight(), true);
        expect(result.getOrElse(() => []), mockDtoList);
        verify(() => mockDatasource.search(searchText)).called(1);
      },
    );

    test(
      'Deve retornar Left(DatabaseSearchException) quando ocorrer PostgrestSearchException',
      () async {
        // Arrange
        when(
          () => mockDatasource.search(searchText),
        ).thenThrow(DatabaseSearchException());

        // Act
        final result = await repository.search(searchText);

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (error) => expect(error, isA<DatabaseSearchException>()),
          (_) => fail('Deveria retornar erro'),
        );
      },
    );

    test(
      'Deve retornar Left(UnknownSearchException) quando ocorrer erro desconhecido',
      () async {
        // Arrange
        when(
          () => mockDatasource.search(searchText),
        ).thenThrow(Exception('Erro inesperado'));

        // Act
        final result = await repository.search(searchText);

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (error) => expect(error, isA<UnknownSearchException>()),
          (_) => fail('Deveria retornar erro'),
        );
      },
    );
  });
}
