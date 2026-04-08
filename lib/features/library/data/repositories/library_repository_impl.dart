import 'package:dartz/dartz.dart';
import 'package:myapp/app/app.dart';

import '../../domain/domain.dart';
import '../datasources/datasources.dart';

class LibraryRepositoryImpl implements LibraryRepository {
  final LibraryLocalDataSource localDataSource;
  final LibraryRemoteDatasource remoteDataSource;

  LibraryRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<AppException, List<LibraryEntity>>> getListBooks() async {
    try {
      final dtos = await localDataSource.getBooks();
      final entities = dtos.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(
        LibraryRepositoryException(message: 'Erro ao carregar livros: $e'),
      );
    }
  }

  @override
  Future<Either<AppException, void>> removeBookInLibrary(String id) async {
    try {
      await localDataSource.removeBook(int.parse(id));
      return const Right(null);
    } catch (e) {
      return Left(
        LibraryRepositoryException(message: 'Erro ao remover livro: $e'),
      );
    }
  }

  @override
  Future<Either<AppException, void>> addBookInLibrary(String id) async {
    try {
      // NOTE: Here we would need a way to get the book details from id.
      // For now, I will assume we might have it or we need a SearchUsecase.
      // But let's fix the call to saveBook if we had a DTO.
      // Wait, LibraryLocalDataSource.saveBook requires a LibraryDTO.
      // I'll check if we can add a method to DataSource to fetch it.

      // Temporary: throwing error to see if it's used yet.
      throw UnimplementedError('addBookInLibrary needs book details');
    } catch (e) {
      return Left(
        LibraryRepositoryException(message: 'Erro ao adicionar livro: $e'),
      );
    }
  }

  @override
  Future<Either<AppException, void>> updateProgress({
    required String id,
    required int page,
  }) async {
    try {
      await localDataSource.updateProgress(id: id, page: page);
      return const Right(null);
    } catch (e) {
      return Left(
        LibraryRepositoryException(message: 'Erro ao atualizar progresso: $e'),
      );
    }
  }

  @override
  Future<Either<AppException, void>> openBook(String path) async {
    try {
      await localDataSource.openBook(path);
      return const Right(null);
    } catch (e) {
      return Left(
        LibraryRepositoryException(message: 'Erro ao abrir livro: $e'),
      );
    }
  }
}
