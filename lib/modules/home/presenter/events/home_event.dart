abstract class HomeEvent {}

class FetchRecentBooks extends HomeEvent {
  final String userId;
  FetchRecentBooks({required this.userId});
}

class FetchRecommendedBooks extends HomeEvent {
  final String userId;
  FetchRecommendedBooks({required this.userId});
}

class RefreshHome extends HomeEvent {}

class ClearHomeError extends HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeLoadingEvent extends HomeEvent {}