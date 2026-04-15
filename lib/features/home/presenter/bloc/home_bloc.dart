import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/features.dart';
import 'package:myapp/features/home/domain/usecases/get_recommendations_usecase.dart';
import 'package:myapp/features/favorite/domain/entities/favorit_entity.dart';
import 'package:myapp/features/library/domain/entities/library_entity.dart';
import 'package:myapp/features/search/domain/entities/result_search_entity.dart';
import '../events/home_event.dart';
import '../states/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetRecommendationsUsecase getRecommendationsUsecase;
  final GetFavoriteUsecaseImpl getFavoriteUsecase;
  final GetListBooksUsecaseImpl getLibraryUsecase;

  HomeBloc({
    required this.getRecommendationsUsecase,
    required this.getFavoriteUsecase,
    required this.getLibraryUsecase,
  }) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    final favoriteResult = await getFavoriteUsecase();
    final libraryResult = await getLibraryUsecase();

    List<FavoritEntity> favorites = [];
    favoriteResult.fold((l) => null, (r) => favorites = r);

    List<LibraryEntity> libraryBooks = [];
    libraryResult.fold((l) => null, (r) => libraryBooks = r);

    // Extract genres for recommendations
    Set<String> genres = {};
    for (var f in favorites) {
      if (f.genero != null) genres.add(f.genero!);
    }
    for (var l in libraryBooks) {
      if (l.genre.isNotEmpty) genres.add(l.genre);
    }

    final recommendationsResult = await getRecommendationsUsecase(genres.toList());

    List<ResultSearchEntity> recommendations = [];
    recommendationsResult.fold((l) => null, (r) => recommendations = r);

    emit(HomeSuccess(
      recommendations: recommendations,
      recentBooks: libraryBooks,
      favoriteBooks: favorites,
    ));
  }
}
