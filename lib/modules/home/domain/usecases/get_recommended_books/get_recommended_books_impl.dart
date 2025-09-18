import 'package:dartz/dartz.dart';
import '../../domain.dart';

abstract class GetRecommendedBooksImpl {
  HomeRepository _repository;
  GetRecommendedBooksImpl(this._repository);
  Future<Either<ErrorHome, List<EbookEntity>>> call(String userId) async{
    return await _repository.getRecommendedBooks(userId);
  } 
}