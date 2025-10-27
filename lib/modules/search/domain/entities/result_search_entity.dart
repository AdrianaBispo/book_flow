abstract class ResultSearchEntity {
    final int id;
    final String title;
    final String author;
    final String? cover_url;
    final String? download_url;
    ResultSearchEntity({required this.id, required this.author, required this.title, this.cover_url, this.download_url});
}