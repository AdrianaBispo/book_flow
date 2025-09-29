import 'package:myapp/modules/modules.dart';
import '../../home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeInitialState()) {
    on<FetchRecentBooks>(_onFetchRecentBooks);
  }

  void _onFetchRecentBooks(
    FetchRecentBooks event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());

    final recommendedBooksResult = await homeRepository.getRecommendedBooks(
      userId: event.userId,
    );

    if (recommendedBooksResult.isRight()) {
      recommendedBooksResult.fold(
        (error) => emit(HomeErrorState(message: error.toString())),
        (recommendedBooks) {
          emit(
            HomeLoadedState(
              recentBooks: [],
              recommendedBooks: recommendedBooks,
            ),
          );
        },
      );
    } else {
      emit(HomeErrorState(message: 'Failed to fetch recommended books'));
    }
  }
}
