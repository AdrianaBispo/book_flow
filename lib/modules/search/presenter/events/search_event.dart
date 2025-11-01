abstract class SearchEvent {
  const SearchEvent();
}

class SearchTextChanged extends SearchEvent {
  final String searchText;

  const SearchTextChanged(this.searchText);
}

class SearchCleared extends SearchEvent {
  const SearchCleared();
}
