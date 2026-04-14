abstract class FavoritEntity {
  final int id;
  final int bookId;
  final String title;
  final String author;
  final String? coverUrl;
  final String? downloadUrl;
  final String? genero;

  FavoritEntity({
    required this.id,
    required this.bookId,
    required this.author,
    required this.title,
    this.coverUrl,
    this.downloadUrl,
    this.genero,
  });
}
