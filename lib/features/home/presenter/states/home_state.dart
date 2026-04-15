import 'package:myapp/features/features.dart';
import 'package:myapp/features/favorite/domain/entities/favorit_entity.dart';
import 'package:myapp/features/library/domain/entities/library_entity.dart';
import 'package:myapp/features/search/domain/entities/result_search_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ResultSearchEntity> recommendations;
  final List<LibraryEntity> recentBooks;
  final List<FavoritEntity> favoriteBooks;

  HomeSuccess({
    required this.recommendations,
    required this.recentBooks,
    required this.favoriteBooks,
  });
}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}
