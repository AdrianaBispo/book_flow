abstract class ErrorHome implements Exception {}

class ErrorFetchingRecentBooks extends ErrorHome {
  final String message;
  ErrorFetchingRecentBooks(this.message);
}