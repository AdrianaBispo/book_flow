import 'package:myapp/modules/home/data/data.dart';

abstract class HomeDatasourceRemote {
  Future<List<EbookDto>> getRecentBooks({
    required String userId,
  });
  Future<List<EbookDto>> getRecommendedBooks({
    required String userId,
  });
}