import 'package:dartz/dartz.dart';
import '../../domain.dart';

abstract class GetRecommendedBooksImpl {
  final HomeRepository _repository;
  
  GetRecommendedBooksImpl(this._repository);

  @override
  Future<Either<ErrorHome, List<EbookEntity>>> call(String userId) async{
    return await _repository.getRecommendedBooks(userId);
  } 
}