import 'package:myapp/modules/modules.dart';
import 'package:myapp/core/utils/utils.dart';

abstract class SearchRepository {
  Future<Either<AppException,List<ResultSearchEntity>>> search(
    String searchText
  );
}
