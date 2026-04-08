import 'package:myapp/app/app.dart';
import '../domain.dart';

abstract class SearchRepository {
  Future<Either<AppException, List<ResultSearchEntity>>> search(
    String searchText,
  );
}
