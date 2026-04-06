import 'package:myapp/core/core.dart';
import 'package:myapp/modules/modules.dart';

abstract class LibraryRepository {
  Future<Either<AppException, List<LibraryEntity>>> getListBooks();
  Future<Either<AppException, void>> removeBookInLibrary(String id);
  Future<Either<AppException, void>> addBookInLibrary(String id);
}