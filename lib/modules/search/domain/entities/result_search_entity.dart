abstract class ResultSearchEntity {
  final int id;
  final String title;
  final String author;
  final String? coverUrl;
  final String? downloadUrl;
  final String? genero;
  ResultSearchEntity({
    required this.id,
    required this.author,
    required this.title,
    this.coverUrl,
    this.downloadUrl,
    this.genero
  });
}
