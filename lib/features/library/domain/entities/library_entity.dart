import 'package:myapp/features/library/domain/domain.dart';

class LibraryEntity {
  final String id;
  final String title;
  final String author;
  final String coverPath; 
  final String epubPath;
  final String genre;
  final ReadingStatus status;
  final int currentPage;

  LibraryEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.coverPath,
    required this.epubPath,
    required this.status,
    required this.genre,
    this.currentPage = 0,
  });
}