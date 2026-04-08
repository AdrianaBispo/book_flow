import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/features/help/help.dart';

class MockHelpDatasourceLocal extends Mock implements HelpDatasourceLocal {}

void main() {
  late MockHelpDatasourceLocal datasource;
  late HelpRepositoryImpl repository;

  setUp(() {
    datasource = MockHelpDatasourceLocal();
    repository = HelpRepositoryImpl(datasource);
  });

  test(
    'deve retornar Right contendo uma lista de HelpItemEntity quando sucesso',
    () async {
      when(() => datasource.getHelpItems()).thenAnswer((_) async => []);

      final result = await repository.getHelpItems();

      expect(result, isA<Right>());
      verify(() => datasource.getHelpItems()).called(1);
    },
  );

  test(
    'deve retornar Left contendo UnknownHelpException em caso de erro',
    () async {
      when(() => datasource.getHelpItems()).thenThrow(Exception());

      final result = await repository.getHelpItems();

      expect(result, isA<Left>());
      result.fold(
        (l) => expect(l, isA<UnknownHelpException>()),
        (r) => fail('deveria ser erro'),
      );
    },
  );
}
