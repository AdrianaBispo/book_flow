import 'package:myapp/modules/modules.dart';
abstract class SearchDatasourceRemote {
  Future<List<ResultSearchDto>> search(String searchText);
}