
abstract class FavoriteEvent {}

class LoadFavorites extends FavoriteEvent {}

class AddToFavorite extends FavoriteEvent {
  final int bookId;
  AddToFavorite(this.bookId);
}

class RemoveFromFavorite extends FavoriteEvent {
  final int bookId;
  RemoveFromFavorite(this.bookId);
}