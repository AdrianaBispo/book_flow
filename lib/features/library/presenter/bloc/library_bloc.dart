import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/library/domain/domain.dart';
import '../presenter.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final GetListBooksUsecaseImpl getListBooks;
  final AddBookInLibraryUsecaseImpl addBook;
  final RemoveBookFromLibraryUsecaseImpl removeBook;

  LibraryBloc({
    required this.getListBooks,
    required this.addBook,
    required this.removeBook,
  }) : super(LibraryInitial()) {
    on<LoadLibrary>(_onLoadLibrary);
    on<RemoveBookFromLibrary>(_onRemoveBook);
  }

  Future<void> _onLoadLibrary(LoadLibrary event, Emitter<LibraryState> emit) async {
    emit(LibraryLoading());
    final result = await getListBooks();
    result.fold(
      (failure) => emit(LibraryFailure(failure)),
      (books) => emit(LibraryLoaded(books)),
    );
  }

  Future<void> _onRemoveBook(RemoveBookFromLibrary event, Emitter<LibraryState> emit) async {
    final result = await removeBook(event.id);
    result.fold(
      (failure) => emit(LibraryFailure(failure)),
      (_) => add(LoadLibrary()),
    );
  }
}
