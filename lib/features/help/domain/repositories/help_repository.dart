import 'package:myapp/features/features.dart';
import '../entities/help_item.dart';

abstract class HelpRepository {
  Future<Either<dynamic, List<HelpItem>>> getHelpItems();
}
