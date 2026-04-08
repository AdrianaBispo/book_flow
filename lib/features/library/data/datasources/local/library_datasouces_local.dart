import 'package:myapp/features/library/data/dtos/library_dto.dart';

abstract class LibraryLocalDataSource {
  Future<List<LibraryDTO>> getBooks();
  Future<void> saveBook(LibraryDTO book);
  Future<void> updateProgress({required String id, required int page});
  Future<bool> exists(int bookId);
  Future<void> removeBook(int bookId);
  Future<void> openBook(String path);
}
