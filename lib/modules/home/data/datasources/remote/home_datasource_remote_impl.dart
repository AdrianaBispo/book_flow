
import '../../../home.dart';
import 'package:myapp/modules/modules.dart';

class HomeDatasourceRemoteImpl extends HomeDatasourceRemote {
  final SupabaseClient supabaseClient;

  HomeDatasourceRemoteImpl({required this.supabaseClient});

  @override
  Future<List<EbookEntity>> getRecentBooks({required String userId}) async {
    try {
      final response = await supabaseClient.from('sgb_ebook').select();

      if (response.isEmpty) {
        return [];
      }

      return response.map((item) => EbookDto.fromMap(item)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<EbookEntity>> getRecommendedBooks({required String userId}) {
    // TODO: implement getRecommendedBooks
    throw UnimplementedError();
  }
}
