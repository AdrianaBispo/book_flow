
abstract class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  const AppException({required this.message, this.stackTrace});
}