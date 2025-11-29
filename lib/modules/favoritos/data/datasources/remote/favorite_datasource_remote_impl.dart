import 'package:myapp/modules/favoritos/data/dtos/dtos.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'favorite_datasource_remote.dart';

class FavoriteDatasourceRemoteImpl implements FavoriteDatasourceRemote {
  final SupabaseClient client;

  FavoriteDatasourceRemoteImpl({required this.client});

  @override
  Future<List<FavoritoDto>> getFavoriteList({required int idUser}) async {
    try {
      final response = await client
          .from('vw_favoritos')
          .select()
          .eq('user_id', idUser);

      List<FavoritoDto> data = response
          .map((toElement) => FavoritoDto.fromJson(toElement))
          .toList();
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> removeFavorite({
    required int favoriteId,
    required int idUser,
  }) async {
    try {
      await client
          .from('sgb_favoritos')
          .delete()
          .eq('id', favoriteId)
          .eq('user_id', idUser);
    } catch (e) {
      throw Exception(e);
    }
  }
}
