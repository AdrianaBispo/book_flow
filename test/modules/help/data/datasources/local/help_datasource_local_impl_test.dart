import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/features/help/help.dart';

void main() {
  late HelpDatasourceLocalImpl datasource;

  setUp(() {
    datasource = HelpDatasourceLocalImpl();
  });

  test('deve retornar uma lista de HelpItemDto do data source local', () async {
    final result = await datasource.getHelpItems();
    
    expect(result, isA<List<HelpItemEntity>>());
    expect(result.isNotEmpty, true);
    expect(result.first.id, 1);
    expect(result.first.title, 'faq1Title');
  });
}
