import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/features/help/help.dart';

class MockHelpRepository extends Mock implements HelpRepository {}

void main() {
  late MockHelpRepository repository;
  late GetHelpItemsImpl usecase;

  setUp(() {
    repository = MockHelpRepository();
    usecase = GetHelpItemsImpl(repository);
  });

  test('deve repassar o Right contendo os itens quando sucesso', () async {
    when(
      () => repository.getHelpItems(),
    ).thenAnswer((_) async => const Right([]));

    final result = await usecase.call();

    expect(result, const Right([]));
    verify(() => repository.getHelpItems()).called(1);
  });

  test(
    'deve repassar o Left contendo algum AppException quando ocorrer erro',
    () async {
      final error = UnknownHelpException(stackTrace: StackTrace.current);
      when(
        () => repository.getHelpItems(),
      ).thenAnswer((_) async => Left(error));

      final result = await usecase.call();

      expect(result.fold((l) => l, (r) => null), isA<UnknownHelpException>());
      verify(() => repository.getHelpItems()).called(1);
    },
  );
}
