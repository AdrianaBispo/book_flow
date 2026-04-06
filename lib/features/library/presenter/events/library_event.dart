import 'package:myapp/features/library/domain/domain.dart';

abstract class LibraryEvent {}

class LoadLibrary extends LibraryEvent {}

class AddBookToLibrary extends LibraryEvent {
  final LibraryEntity book;
  AddBookToLibrary(this.book);
}

class RemoveBookFromLibrary extends LibraryEvent {
  final String id;
  RemoveBookFromLibrary(this.id);
}

class UpdateReadingProgress extends LibraryEvent {
  final String id;
  final int page;
  UpdateReadingProgress({required this.id, required this.page});
}
