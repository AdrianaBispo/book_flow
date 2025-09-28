import 'package:myapp/modules/modules.dart';
import '../../domain.dart';

class GetRecentBooksImpl implements GetRecentBooks {
  final HomeRepository _repository;
  
  GetRecentBooksImpl(this._repository);

  @override
  Future<Either<ErrorHome, List<EbookEntity>>> call(String userId) async{
    return await _repository.getRecommendedBooks(userId: userId);
  } 
}