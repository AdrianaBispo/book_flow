import 'package:myapp/modules/modules.dart';

class SearchDataSourceImpl implements SearchDatasourceRemote {
  final SupabaseClient supabase;

  SearchDataSourceImpl(this.supabase);

  @override
  Future<List<ResultSearchDto>> search(String searchText) async {
    try {
      // Se não houver texto de busca, traz todos os livros
      if (searchText.trim().isEmpty) {
        final response = await supabase
            .from('vw_ebook')
            .select('*')
            .order('title', ascending: true);

        final List data = response;
        return data.map((item) => ResultSearchDto.fromJson(item)).toList();
      }

      // Caso haja texto de busca, filtra por título OU autor
      final response = await supabase
          .from('vw_ebook')
          .select('*')
          .or('title.ilike.%$searchText%,author.ilike.%$searchText%')
          .order('title', ascending: true);

      final List data = response;
      return data.map((item) => ResultSearchDto.fromJson(item)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
