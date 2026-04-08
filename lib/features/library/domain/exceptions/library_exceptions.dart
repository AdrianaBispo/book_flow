import 'package:myapp/app/app.dart';

class LibraryException extends AppException {
  final String message;
  LibraryException({required this.message, super.stackTrace});
}

class LibraryRepositoryException extends LibraryException {
  LibraryRepositoryException({required super.message, super.stackTrace});
}

class LibraryDataSourceException extends LibraryException {
  LibraryDataSourceException({required super.message, super.stackTrace});
}
