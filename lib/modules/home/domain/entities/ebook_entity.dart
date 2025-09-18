abstract class EbookEntity {
  final int id;
  final String title;
  final String author;
  final String? coverImageUrl;
  final String? description;

  EbookEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.coverImageUrl,
    required this.description,
  });
}