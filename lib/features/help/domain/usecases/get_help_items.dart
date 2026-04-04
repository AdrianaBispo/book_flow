import 'package:myapp/app/app.dart';
import '../../../../shared/shared.dart';
import '../domain.dart';


class GetHelpItemsImpl implements Usecase<Either, List<HelpItemEntity>> {
  final HelpRepository repository;

  GetHelpItemsImpl(this.repository);

  @override
  Future<Either<AppException, List<HelpItemEntity>>> call({
    List<HelpItemEntity>? param,
  }) async {
    return await repository.getHelpItems();
  }
}
