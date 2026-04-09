abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}
class FavoriteLoading extends FavoriteState {}
class FavoriteLoaded extends FavoriteState {
  final List<FavoriteEntity> favorites;
  FavoriteLoaded(this.favorites);
}
class FavoriteFailure extends FavoriteState {
  final AppException failure;
  FavoriteFailure(this.failure);
}
