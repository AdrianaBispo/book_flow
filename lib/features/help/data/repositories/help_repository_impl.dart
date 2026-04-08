import 'package:myapp/app/exceptions/app_exception.dart';
import 'package:myapp/features/features.dart';

class HelpRepositoryImpl implements HelpRepository {
  final HelpDatasourceLocal datasource;

  HelpRepositoryImpl(this.datasource);

  @override
  Future<Either<AppException, List<HelpItemEntity>>> getHelpItems() async {
    try {
      final items = await datasource.getHelpItems();
      return Right(items);
    } catch (e) {
      return Left(UnknownHelpException(stackTrace: StackTrace.current));
    }
  }
}
