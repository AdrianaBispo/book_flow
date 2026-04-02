import 'package:myapp/modules/modules.dart';
import 'package:myapp/core/utils/utils.dart';

// class SearchUsecaseImpl implements SearchUsecase {
//     final SearchRepository _repository;
//     SearchUsecaseImpl(this._repository);

//     @override
//      Future<Either<AppException,List<ResultSearchEntity>>> call (String searchText) async{
//         return await _repository.search(searchText);
//      }

// }

class SearchUsecaseImpl implements Usecase<Either<AppException, List<ResultSearchEntity>> {
  final SearchRepository _repository;

  SearchUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, List<ResultSearchEntity>>> call(
      String searchText) async {
    return await _repository.search(searchText);
  }
}