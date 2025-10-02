import 'package:myapp/modules/modules.dart';
import 'package:myapp/modules/home/home.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasourceRemote dataSource;

  HomeRepositoryImpl({required this.dataSource});

  @override
  Future<Either<ErrorHome, List<EbookEntity>>> getRecentBooks({
    required String userId,
  }) async {
    try {
   
      final List<EbookEntity> ebooks = await dataSource.getRecentBooks(
        userId: userId,
      );
      final List<EbookEntity> bookEntities = ebooks
          .map((book) => ebooks as EbookEntity)
          .toList();
      return Right(bookEntities);
    } on PostgrestException catch (e) {
      return Left(
        ErrorFetchingRecentBooks('Erro no banco de dados: ${e.message}'),
      );
    } on Exception catch (e) {
      return Left(ErrorFetchingRecentBooks('Erro inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<ErrorHome, List<EbookEntity>>> getRecommendedBooks({
    required String userId,
  }) {
    // TODO: implement getRecommendedBooks
    throw UnimplementedError();
  }
}
