import 'package:myapp/app/app.dart';
import 'package:myapp/features/features.dart';
import '../../../../shared/shared.dart';

abstract class HelpRepository {
  Future<Either<AppException, List<HelpItemEntity>>> getHelpItems();
}
