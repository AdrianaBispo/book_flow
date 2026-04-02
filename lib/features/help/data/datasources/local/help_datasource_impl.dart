import '../help_datasource.dart';
import '../../models/help_item_model.dart';

class HelpDatasourceImpl implements HelpDatasource {
  @override
  Future<List<HelpItemModel>> getHelpItems() async {
    // Retornando apenas chaves para tradução na UI
    return [
      HelpItemModel(id: 1, title: 'faq1Title', content: 'faq1Content'),
      HelpItemModel(id: 2, title: 'faq2Title', content: 'faq2Content'),
      HelpItemModel(id: 3, title: 'faq3Title', content: 'faq3Content'),
      HelpItemModel(id: 4, title: 'faq4Title', content: 'faq4Content'),
      HelpItemModel(id: 5, title: 'faq5Title', content: 'faq5Content'),
    ];
  }
}
