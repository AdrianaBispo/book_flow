import 'package:myapp/app/app.dart';
import 'package:myapp/features/features.dart';
import 'package:myapp/features/search/domain/entities/result_search_entity.dart';

abstract class GetRecommendationsUsecase {
  Future<Either<AppException, List<ResultSearchEntity>>> call(
    List<String> genres,
  );
}

class GetRecommendationsUsecaseImpl implements GetRecommendationsUsecase {
  final SearchRepository _searchRepository;

  GetRecommendationsUsecaseImpl(this._searchRepository);

  @override
  Future<Either<AppException, List<ResultSearchEntity>>> call(
    List<String> genres,
  ) async {
    // If no genres, search for a default term or "popular"
    String searchTerm = genres.isEmpty ? 'best sellers' : genres.join(' ');
    
    // Limit to a few genres to avoid too long query
    if (genres.length > 3) {
      searchTerm = genres.take(3).join(' ');
    }

    return await _searchRepository.search(searchTerm);
  }
}
