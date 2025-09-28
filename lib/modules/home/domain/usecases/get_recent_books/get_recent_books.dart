import 'package:dartz/dartz.dart';
import '../../domain.dart';

abstract class GetRecentBooks {
  Future<Either<ErrorHome, List<EbookEntity>>> call(String userId);
}