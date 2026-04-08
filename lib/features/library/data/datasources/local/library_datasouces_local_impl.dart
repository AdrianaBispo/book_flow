import 'dart:io';
import 'package:hive/hive.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';
import 'package:myapp/core/core.dart';
import '../datasources.dart';
import '../../dtos/library_dto.dart';

class LibraryLocalDataSourceImpl implements LibraryLocalDataSource {
  final Box _box;
  final LibraryRemoteDataSource _remoteDataSource;

  LibraryLocalDataSourceImpl(
    this._box,
    this._remoteDataSource,
  );

  @override
  Future<List<LibraryDTO>> getBooks() async {
    return _box.values
        .map((e) => LibraryDTO.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  Future<void> updateProgress({
    required String id,
    required int page,
  }) async {
    final data = _box.get(id);

    if (data != null) {
      final book = LibraryDTO.fromMap(Map<String, dynamic>.from(data));
      final updatedBook = book.copyWith(currentPage: page);

      await _box.put(id, updatedBook.toMap());
    }
  }

  @override
  Future<void> saveBook(LibraryDTO book) async {
    if (_box.containsKey(book.id)) return;

    final (epubPath, coverPath) = await _remoteDataSource.downloadBook(
      epubUrl: book.epubPath,
      coverUrl: book.coverPath,
      fileName: book.id.toString(),
    );

    final updatedBook = book.copyWith(
      epubPath: epubPath,
      coverPath: coverPath,
    );

    await _box.put(book.id, updatedBook.toMap());
  }

  @override
  Future<bool> exists(int bookId) async {
    return _box.containsKey(bookId);
  }

  @override
  Future<void> removeBook(int id) async {
    final data = _box.get(id);

    if (data != null) {
      final book = LibraryDTO.fromMap(Map<String, dynamic>.from(data));

      final epubFile = File(book.epubPath);
      final coverFile = File(book.coverPath);

      if (await epubFile.exists()) {
        await epubFile.delete();
      }

      if (await coverFile.exists()) {
        await coverFile.delete();
      }

      await _box.delete(id);
    }
  }

  @override
  Future<void> openBook(String path) async {
    VocsyEpub.setConfig(
      themeColor: AppColors.primaryPurple,
      identifier: "iosBook",
      scrollDirection: EpubScrollDirection.ALL_DIRECTIONS,
      allowSharing: true,
      enableTts: true,
      nightMode: true,
    );

    VocsyEpub.open(path);
  }
}