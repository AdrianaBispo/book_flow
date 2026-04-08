import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class LibraryRemoteDataSourceImpl implements LibraryRemoteDataSource {
  @override
  Future<(String epubPath, String coverPath)> downloadBook({
    required String epubUrl,
    required String coverUrl,
    required String fileName,
    Function(double progress)? onProgress,
  }) async {
    
    Directory? appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    final booksDir = Directory('${appDocDir!.path}/books');
    final coversDir = Directory('${appDocDir!.path}/covers');

    if (!await booksDir.exists()) {
      await booksDir.create(recursive: true);
    }

    if (!await coversDir.exists()) {
      await coversDir.create(recursive: true);
    }

    final epubPath = await _downloadFile(
      url: epubUrl,
      path: '${booksDir.path}/$fileName.epub',
      onProgress: onProgress,
    );

    // 📸 COVER
    final coverPath = await _downloadFile(
      url: coverUrl,
      path: '${coversDir.path}/$fileName.jpg',
    );

    return (epubPath, coverPath);
  }

   Future<String> _downloadFile({
    required String url,
    required String path,
    Function(double progress)? onProgress,
  }) async {
    final request = http.Request('GET', Uri.parse(url));
    final response = await request.send();

    if (response.statusCode != 200) {
      throw Exception('Erro no download');
    }

    final file = File(path);
    final sink = file.openWrite();

    final total = response.contentLength ?? 0;
    int received = 0;

    await for (var chunk in response.stream) {
      received += chunk.length;
      sink.add(chunk);

      if (total != 0 && onProgress != null) {
        onProgress(received / total);
      }
    }

    await sink.close();

    return path;
  }
}
}