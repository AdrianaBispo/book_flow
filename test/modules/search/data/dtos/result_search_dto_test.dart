import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/modules/search/data/dtos/dtos.dart';

void main() {
  group('ResultSearchDto', () {
    final json = {
      'id': 1,
      'author': 'Author Name',
      'title': 'Book Title',
      'cover_url': 'https://example.com/cover.jpg',
      'download_url': 'https://example.com/download.pdf',
      'genero': null,
    };

    test('deve converter JSON para DTO corretamente', () {
      // act
      final dto = ResultSearchDto.fromJson(json);

      // assert
      expect(dto.id, equals(1));
      expect(dto.author, equals('Author Name'));
      expect(dto.title, equals('Book Title'));
      expect(dto.coverUrl, equals('https://example.com/cover.jpg'));
      expect(dto.downloadUrl, equals('https://example.com/download.pdf'));
    });

    test('deve converter DTO para JSON corretamente', () {
      // arrange
      final dto = ResultSearchDto(
        id: 1,
        author: 'Author Name',
        title: 'Book Title',
        coverUrl: 'https://example.com/cover.jpg',
        downloadUrl: 'https://example.com/download.pdf',
        genero: null
      );

      // act
      final result = dto.toJson();

      // assert
      expect(result, equals(json));
    });

    test('deve converter id string para int corretamente no fromJson', () {
      // arrange
      final jsonStringId = {
        'id': '10',
        'author': 'String ID Author',
        'title': 'String ID Title',
        'cover_url': null,
        'download_url': null,
      };

      // act
      final dto = ResultSearchDto.fromJson(jsonStringId);

      // assert
      expect(dto.id, equals(10));
      expect(dto.author, equals('String ID Author'));
      expect(dto.title, equals('String ID Title'));
      expect(dto.coverUrl, equals(''));
      expect(dto.downloadUrl, equals(''));
    });
  });
}
