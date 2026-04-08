import 'package:myapp/app/app.dart';
import '../../../search/search.dart';
import '../domain.dart';

abstract class LibraryRepository {
  Future<Either<AppException, List<LibraryEntity>>> getListBooks();
  Future<Either<AppException, void>> removeBookInLibrary(String id);
  Future<Either<AppException, void>> addBookInLibrary(String id);
  Future<Either<AppException, void>> updateProgress({
    required String id,
    required int page,
  });
  Future<Either<AppException, void>> openBook(String path);
}
