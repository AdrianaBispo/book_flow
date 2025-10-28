import 'package:myapp/modules/modules.dart';

class SearchDataSourceRemoteImpl implements SearchDatasourceRemote {
  final SupabaseClient supabaseClient;

  SearchDataSourceRemoteImpl(this.supabaseClient);

  @override
  Future<List<ResultSearchDto>> search(String searchText) async {
    try {
      // Se não houver texto de busca, traz todos os livros
      if (searchText.trim().isEmpty) {
<<<<<<< HEAD
        final response = await supabase
            .from('vw_ebook')
=======
        final response = await supabaseClient
            .from('books')
>>>>>>> bfbc6da (refactor: alterado nome da class)
            .select('*')
            .order('title', ascending: true);

        final List data = response;
        return data.map((item) => ResultSearchDto.fromJson(item)).toList();
      }

      // Caso haja texto de busca, filtra por título OU autor
<<<<<<< HEAD
      final response = await supabase
          .from('vw_ebook')
=======
      final response = await supabaseClient
          .from('books')
>>>>>>> bfbc6da (refactor: alterado nome da class)
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
