import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/exceptions/app_exception.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasourceRemote dataSource;
  SearchRepositoryImpl({required this.dataSource});

  @override
  Future<Either<AppException, List<ResultSearchEntity>>> search(
    String searchText,
  ) async {
    try {
      final result = await dataSource.search(searchText);
      return Right(result);
    } on DatabaseSearchException catch (e) {
      return Left( DatabaseSearchException(message: 'Erro ao buscar dados: ${e.message}'));
    } catch (e) {
      return Left( UnknownSearchException(message: 'Erro inesperado: $e')
      );
    } 
  }
}