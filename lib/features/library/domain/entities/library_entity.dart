class LibraryEntity {
  final String id;
  final String title;
  final String author;
  final String cover; // TODO: COLOCAR A IMAGEM LOCALMENTE
  final String genre;
  final String status;
  final int currentPage;
  final String path; // caminho local do epub

  LibraryEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.cover,
    required this.genre,
    required this.status,
    this.currentPage = 0,
    required this.path,
  });
}