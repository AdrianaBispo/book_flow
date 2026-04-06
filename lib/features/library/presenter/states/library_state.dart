import 'package:myapp/features/library/domain/domain.dart';
import 'package:myapp/core/core.dart';

abstract class LibraryState {}

class LibraryInitial extends LibraryState {}

class LibraryLoading extends LibraryState {}

class LibraryLoaded extends LibraryState {
  final List<LibraryEntity> books;
  LibraryLoaded(this.books);
}

class LibraryFailure extends LibraryState {
  final AppException exception;
  LibraryFailure(this.exception);
}

class LibraryOperationSuccess extends LibraryState {
  final String message;
  LibraryOperationSuccess(this.message);
}
