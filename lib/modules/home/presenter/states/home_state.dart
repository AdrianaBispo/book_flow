abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}
class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}

class HomeLoadedState extends HomeState {
  final List recentBooks;
  final List recommendedBooks;

  HomeLoadedState({
    required this.recentBooks,
    required this.recommendedBooks,
  });
}
