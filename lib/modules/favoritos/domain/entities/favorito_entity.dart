abstract class FavoritoEntity {
  final int id;
  final String title;
  final String author;
  final String? coverUrl;
  final String? downloadUrl;
  final String? genero;

  FavoritoEntity({
    required this.id,
    required this.author,
    required this.title,
    this.coverUrl,
    this.downloadUrl,
    this.genero,
  });
}
