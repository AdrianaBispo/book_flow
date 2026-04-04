import '../../../help.dart';

abstract class HelpDatasourceLocal {
  Future<List<HelpItemDto>> getHelpItems();
}
