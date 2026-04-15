import 'package:myapp/features/favorite/data/dtos/dtos.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'favorite_datasource_remote.dart';

class FavoriteDatasourceRemoteImpl implements FavoriteDatasourceRemote {
  final SupabaseClient client;

  FavoriteDatasourceRemoteImpl({required this.client});

  @override
  Future<List<FavoritDto>> getFavoriteList() async {
    try {
      final response = await client
          .from('vw_favoritos')
          .select()
          .eq('user_id', client.auth.currentUser!.id);

      List<FavoritDto> data = response
          .map((toElement) => FavoritDto.fromJson(toElement))
          .toList();
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> removeFavorite({required int favoriteId}) async {
    try {
      await client
          .from('sgb_favoritos')
          .delete()
          .eq('fav_id', favoriteId)
          .eq('user_id', client.auth.currentUser!.id);
    } catch (e) {
      throw Exception(e);
    }
  }

@override
Future<bool> isFavorite({required int ebookId}) async {
  try {
    final response = await client
        .from('sgb_favoritos')
        .select('ebo_id')
        .eq('user_id', client.auth.currentUser!.id)
        .eq('ebo_id', ebookId);
    return response.isNotEmpty;
  } catch (e) {
    throw Exception(e);
  }
}


  @override
  Future<int> addFavorite({required int ebookId}) async {
    try {
      final userId = client.auth.currentUser!.id;

      final isFav = await isFavorite(ebookId: ebookId);
      if (isFav) {
        return ebookId;
      }

      final response = await client
          .from('sgb_favoritos')
          .insert({'user_id': userId, 'ebo_id': ebookId})
          .select('ebo_id')
          .single();

      return  ebookId;
    } catch (e) {
      throw Exception(e);
    }
  }
}
