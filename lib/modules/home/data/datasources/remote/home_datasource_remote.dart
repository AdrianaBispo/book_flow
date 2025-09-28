import '../../../domain/domain.dart';

abstract class HomeDatasourceRemote {
  Future<List<EbookEntity>> getRecentBooks({
    required String userId,
  });
  Future<List<EbookEntity>> getRecommendedBooks({
    required String userId,
  });
}