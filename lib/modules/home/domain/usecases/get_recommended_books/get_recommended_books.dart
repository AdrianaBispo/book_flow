import 'package:dartz/dartz.dart';
import '../../domain.dart';

abstract class GetRecommendedBooks {
  Future<Either<ErrorHome, List<EbookEntity>>> call(String userId);
}