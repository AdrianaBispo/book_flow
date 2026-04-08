abstract class LibraryRemoteDatasource {
  Future<(String epubPath, String coverPath)> downloadBook({
    required String epubUrl,
    required String coverUrl,
    required String fileName,
    Function(double progress)? onProgress,
  });
}
