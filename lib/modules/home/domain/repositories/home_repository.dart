import 'package:dartz/dartz.dart';
import 'package:myapp/modules/home/domain/entities/ebook_entity.dart';

import '../error/error_home.dart';

abstract class HomeRepository {
  Future<Either<ErrorHome, List<EbookEntity>>> getRecentBooks({
    required String userId,
  });
  Future<Either<ErrorHome, List<EbookEntity>>> getRecommendedBooks({
    required String userId,
  });
}
