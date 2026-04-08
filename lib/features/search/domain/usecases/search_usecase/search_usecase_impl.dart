import 'package:myapp/app/app.dart';
import '../../domain.dart';

class SearchUsecaseImpl
    implements Usecase<Either<AppException, List<ResultSearchEntity>>, String> {
  final SearchRepository _repository;

  SearchUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, List<ResultSearchEntity>>> call({
    String? param,
  }) async {
    return await _repository.search(param!);
  }
}
