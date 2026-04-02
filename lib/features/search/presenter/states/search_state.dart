import 'package:myapp/modules/modules.dart';
import 'package:myapp/core/utils/exceptions/app_exception.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchSuccess extends SearchState {
  final List<ResultSearchEntity> results;

  const SearchSuccess(this.results);
}

class SearchEmpty extends SearchState {
  const SearchEmpty();
}

class SearchError extends SearchState {
  final AppException exception;
  
  const SearchError(this.exception);
}