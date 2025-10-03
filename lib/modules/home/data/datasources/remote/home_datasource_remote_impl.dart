import '../../../home.dart';
import 'package:myapp/modules/modules.dart';

class HomeDatasourceRemoteImpl extends HomeDatasourceRemote {
  final SupabaseClient supabaseClient;

  HomeDatasourceRemoteImpl({required this.supabaseClient});

  @override
  Future<List<EbookDto>> getRecentBooks({required String userId}) async {
    try {
      final response = await supabaseClient.from('sgb_ebook').select();

      if (response.isEmpty) {
        return [];
      }

      List<EbookDto> result = response
          .map((item) => EbookDto.fromMap(item))
          .toList();

      //List<EbookEntity> result = listDtos.toList() as List<EbookEntity>;

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<EbookDto>> getRecommendedBooks({required String userId}) {
    // TODO: implement getRecommendedBooks
    throw UnimplementedError();
  }
}
