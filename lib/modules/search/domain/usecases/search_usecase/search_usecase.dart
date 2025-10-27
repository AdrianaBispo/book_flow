import 'package:myapp/modules/modules.dart';
import '../../domain.dart';
import 'package:myapp/utils/utils.dart';

abstract class SearchUsecase {
    Future<Either<AppException,List<ResultSearchEntity>>> call (String searchText);
}