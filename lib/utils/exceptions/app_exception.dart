abstract class AppException implements Exception {
  final StackTrace? stackTrace;
  const AppException({this.stackTrace});
}