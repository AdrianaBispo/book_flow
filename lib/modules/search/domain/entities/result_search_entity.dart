abstract class ResultSearch {
    final int id;
    final String title;
    final String author;
    final String? cover_url;
    final String? download_url;
    ResultSearch({required this.id, required this.title, this.cover_url, this.download_url});
}