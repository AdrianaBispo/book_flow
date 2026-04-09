import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/library/domain/domain.dart';
import '../presenter.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final GetListBooksUsecaseImpl getListBooks;
  final AddBookInLibraryUsecaseImpl addBook;
  final RemoveBookFromLibraryUsecaseImpl removeBook;
  final OpenBookUsecaseImpl openBook;

  LibraryBloc({
    required this.getListBooks,
    required this.addBook,
    required this.removeBook,
    required this.openBook,
  }) : super(LibraryInitial()) {
    on<LoadLibrary>(_onLoadLibrary);
    on<AddBookToLibrary>(_onAddBook);
    on<RemoveBookFromLibrary>(_onRemoveBook);
    on<OpenBook>(_onOpenBook);
  }

  Future<void> _onAddBook(AddBookToLibrary event, Emitter<LibraryState> emit) async {
    final result = await addBook(param: event.book);
    result.fold(
      (failure) => emit(LibraryFailure(failure)),
      (_) => add(LoadLibrary()),
    );
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
    final result = await removeBook(param: event.id);
    result.fold(
      (failure) => emit(LibraryFailure(failure)),
      (_) => add(LoadLibrary()),
    );
  }

  Future<void> _onOpenBook(OpenBook event, Emitter<LibraryState> emit) async {
    final result = await openBook(param: event.path);
    result.fold(
      (failure) => emit(LibraryFailure(failure)),
      (_) => null, // No state change needed for opening external viewer
    );
  }
}

