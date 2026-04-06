import '../../domain/entities/library_entity.dart';
import '../../domain/enums/reading_status.dart';

class LibraryDTO {
  final String id;
  final String title;
  final String author;
  final String coverPath;
  final String epubPath;
  final String genre;
  final int currentPage;
  final String status;

  LibraryDTO({
    required this.id,
    required this.title,
    required this.author,
    required this.coverPath,
    required this.epubPath,
    required this.genre,
    required this.currentPage,
    required this.status,
  });

  factory LibraryDTO.fromMap(Map<String, dynamic> map) {
    return LibraryDTO(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      coverPath: map['coverPath'],
      epubPath: map['epubPath'],
      genre: map['genre'],
      currentPage: map['currentPage'] ?? 0,
      status: map['status'] ?? 'notStarted',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'coverPath': coverPath,
      'epubPath': epubPath,
      'genre': genre,
      'currentPage': currentPage,
      'status': status,
    };
  }

  LibraryEntity toEntity() {
    return LibraryEntity(
      id: id,
      title: title,
      author: author,
      coverPath: coverPath,
      epubPath: epubPath,
      genre: genre,
      currentPage: currentPage,
      status: _mapStatus(status),
    );
  }

  factory LibraryDTO.fromEntity(LibraryEntity entity) {
    return LibraryDTO(
      id: entity.id,
      title: entity.title,
      author: entity.author,
      coverPath: entity.coverPath,
      epubPath: entity.epubPath,
      genre: entity.genre,
      currentPage: entity.currentPage,
      status: entity.status.name,
    );
  }

  static ReadingStatus _mapStatus(String status) {
    return ReadingStatus.values.firstWhere(
      (e) => e.name == status,
      orElse: () => ReadingStatus.notStarted,
    );
  }
}