abstract class LibraryLocalDataSource {
  Future<List<LibraryDTO>> getBooks();
  Future<void> saveBook(LibraryDTO book);
  Future<bool> exists(int bookId);
  Future<void> removeBook(int bookId);
  Future<void> openBook(String path);
}