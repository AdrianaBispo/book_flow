abstract class LibraryRemoteDatasource {
  Future<String> downloadBook({
    required String url,
    required String fileName,
    Function(double progress)? onProgress,
  });
}