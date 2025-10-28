
class SearchRepositoryImpl implements SearchRepository {
    final SearchDatasourceRemote dataSource;
    SearchRepositoryImpl({required this.dataSource});


    @override
    Future<Either<AppException,List<ResultSearchEntity>>>  search(
    String searchText
  ) async {
       
    try{

    } catch(e){

    }
  }   
}