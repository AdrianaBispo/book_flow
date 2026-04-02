import 'package:myapp/features/features.dart';
import '../../domain/entities/help_item.dart';
import '../../domain/repositories/help_repository.dart';
import '../datasources/help_datasource.dart';

class HelpRepositoryImpl implements HelpRepository {
  final HelpDatasource datasource;

  HelpRepositoryImpl(this.datasource);

  @override
  Future<Either<dynamic, List<HelpItem>>> getHelpItems() async {
    try {
      final items = await datasource.getHelpItems();
      return Right(items);
    } catch (e) {
      return Left(e);
    }
  }
}
