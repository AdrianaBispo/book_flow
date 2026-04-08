import '../../../help.dart';


class HelpDatasourceLocalImpl implements HelpDatasourceLocal {
  @override
  Future<List<HelpItemDto>> getHelpItems() async {
    return [
      HelpItemDto(id: 1, title: 'faq1Title', content: 'faq1Content'),
      HelpItemDto(id: 2, title: 'faq2Title', content: 'faq2Content'),
      HelpItemDto(id: 3, title: 'faq3Title', content: 'faq3Content'),
      HelpItemDto(id: 4, title: 'faq4Title', content: 'faq4Content'),
      HelpItemDto(id: 5, title: 'faq5Title', content: 'faq5Content'),
    ];
  }
}
