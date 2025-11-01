import 'package:myapp/modules/modules.dart';
import 'package:myapp/utils/exceptions/app_exception.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;

  SearchBloc({required this.repository}) : super(const SearchInitial()) {
    on<SearchTextChanged>(_onSearchTextChanged);
    on<SearchCleared>(_onSearchCleared);
  }

  Future<void> _onSearchTextChanged(
    SearchTextChanged event,
    Emitter<SearchState> emit,
  ) async {
    final searchText = event.searchText.trim();

    if (searchText.isEmpty) {
      emit(const SearchInitial());
      return;
    }

    emit(const SearchLoading());

    final result = await repository.search(searchText);

    result.fold(
      (exception) {
        final errorMessage = _getErrorMessage(exception);
        emit(SearchError(exception, errorMessage));
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

  String _getErrorMessage(AppException exception) {
    if (exception is DatabaseSearchException) {
      return 'Não conseguimos acessar os dados no momento.\n'
          'Verifique sua conexão e tente novamente.';
    } else if (exception is UnknownSearchException) {
      return 'Algo inesperado aconteceu.\n'
          'Por favor, tente novamente em alguns instantes.';
    }

    return 'Erro ao realizar a busca.\n'
        'Tente novamente mais tarde.';
  }
}
