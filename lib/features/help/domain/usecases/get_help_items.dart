import 'package:myapp/features/features.dart';
import '../entities/help_item.dart';
import '../repositories/help_repository.dart';

abstract class GetHelpItems {
  Future<Either<dynamic, List<HelpItem>>> call();
}

class GetHelpItemsImpl implements GetHelpItems {
  final HelpRepository repository;

  GetHelpItemsImpl(this.repository);

  @override
  Future<Either<dynamic, List<HelpItem>>> call() async {
    return await repository.getHelpItems();
  }
}
