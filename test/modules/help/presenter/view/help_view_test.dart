import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/features/help/help.dart';
import 'package:myapp/app/app.dart';

class MockHelpBloc extends MockBloc<HelpEvent, HelpState> implements HelpBloc {}

void main() {
  late MockHelpBloc mockHelpBloc;

  setUp(() {
    mockHelpBloc = MockHelpBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<HelpBloc>.value(
        value: mockHelpBloc,
        child: const HelpView(),
      ),
    );
  }

  testWidgets('deve mostrar loading quando o estado for carregando', (tester) async {
    when(() => mockHelpBloc.state).thenReturn(const HelpState(status: HelpStatus.loading));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('deve mostrar mensagem de erro quando o estado for failure', (tester) async {
    when(() => mockHelpBloc.state).thenReturn(const HelpState(status: HelpStatus.failure, errorMessage: 'Erro bizarro'));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.text('Erro bizarro'), findsOneWidget);
  });

  testWidgets('deve renderizar a estrutura da página principal quando o estado for success com itens vazio', (tester) async {
    when(() => mockHelpBloc.state).thenReturn(const HelpState(status: HelpStatus.success, items: []));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}
