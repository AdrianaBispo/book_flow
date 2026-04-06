import 'package:myapp/modules/modules.dart';
import 'package:myapp/core/utils/utils.dart';

abstract class SearchRepository {
  Future<Either<AppException,List<ResultSearchEntity>>> search(
    String searchText
  );
  Future<Either<AppException, void>> addFavorite(int favoriteId);
  Future<Either<AppException, void>> removeFavorite(int favoriteId);
  Future<Either<AppException, void>> addInLibrary(int bookId);
}
