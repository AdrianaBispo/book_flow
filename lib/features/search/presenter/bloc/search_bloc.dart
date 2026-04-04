import 'package:dartz/dartz.dart';

import '../../../../app/app.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  //final SearchRepository repository;
  final Usecase<Either<AppException, List<ResultSearchEntity>>> usecaseSearch;

  SearchBloc({required this.usecaseSearch}) : super(const SearchInitial()) {
    on<SearchTextChanged>(_onSearchTextChanged);
    on<SearchCleared>(_onSearchCleared);
  }

  Future<void> _onSearchTextChanged(
    SearchTextChanged event,
    Emitter<SearchState> emit,
  ) async {
    final searchText = event.searchText.trim();

    emit(const SearchLoading());

    final result = await usecaseSearch(searchText);

    result.fold(
      (exception) {
        emit(SearchError(exception));
      },
      (results) {
        if (results.isEmpty) {
          emit(const SearchEmpty());
        } else {
          emit(SearchSuccess(results));
        }
      },
    );
  }

  void _onSearchCleared(SearchCleared event, Emitter<SearchState> emit) {
    emit(const SearchInitial());
  }

}
