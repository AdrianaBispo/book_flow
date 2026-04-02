import '../models/help_item_model.dart';

abstract class HelpDatasource {
  Future<List<HelpItemModel>> getHelpItems();
}
