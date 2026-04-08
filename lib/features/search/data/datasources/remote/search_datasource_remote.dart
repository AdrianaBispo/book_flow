import '../../../search.dart';

abstract class SearchDatasourceRemote {
  Future<List<ResultSearchDto>> search(String searchText);
}