import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/app/app.dart';
import '../../search.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Usecase<Either<AppException, List<ResultSearchEntity>>, String>
  usecaseSearch;

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

    final result = await usecaseSearch(param: searchText);

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
