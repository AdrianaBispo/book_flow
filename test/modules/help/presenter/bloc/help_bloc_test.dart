import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:myapp/features/help/help.dart';
import 'package:myapp/app/app.dart';

class MockGetHelpItems extends Mock implements Usecase {}

void main() {
  late HelpBloc bloc;
  late MockGetHelpItems mockGetHelpItems;

  setUp(() {
    mockGetHelpItems = MockGetHelpItems();
    bloc = HelpBloc(getHelpItems: mockGetHelpItems);
  });

  tearDown(() {
    bloc.close();
  });

  test('estado inicial deve ser HelpState() com status initial', () {
    expect(bloc.state.status, equals(HelpStatus.initial));
  });

  blocTest<HelpBloc, HelpState>(
    'deve emitir [loading, success] quando buscar itens com sucesso',
    build: () {
      when(() => mockGetHelpItems.call()).thenAnswer(
        (_) async => const Right(<HelpItemEntity>[]),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const HelpGetItemsStarted()),
    expect: () => [
      const HelpState(status: HelpStatus.loading),
      const HelpState(status: HelpStatus.success, items: []),
    ],
  );

  blocTest<HelpBloc, HelpState>(
    'deve emitir [loading, failure] quando buscar itens falhar',
    build: () {
      final error = UnknownHelpException(stackTrace: StackTrace.current);
      when(() => mockGetHelpItems.call()).thenAnswer(
        (_) async => Left(error),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const HelpGetItemsStarted()),
    expect: () => [
      const HelpState(status: HelpStatus.loading),
      HelpState(status: HelpStatus.failure, errorMessage: UnknownHelpException(stackTrace: StackTrace.current).toString()),
    ],
  );
}
