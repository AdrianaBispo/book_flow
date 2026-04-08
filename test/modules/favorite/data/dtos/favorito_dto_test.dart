import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/features/favorite/data/dtos/dtos.dart';

void main() {
  group('FavoritDto', () {
    test('deve criar FavoritDto a partir de JSON corretamente', () {
      final json = {
        'id': 1,
        'title': 'O Senhor dos Anéis',
        'author': 'J.R.R. Tolkien',
        'coverUrl': 'https://example.com/capa.jpg',
        'downloadUrl': 'https://example.com/download.pdf',
        'genero': 'Fantasia',
      };

      final dto = FavoritDto.fromJson(json);

      expect(dto.id, 1);
      expect(dto.title, 'O Senhor dos Anéis');
      expect(dto.author, 'J.R.R. Tolkien');
      expect(dto.coverUrl, 'https://example.com/capa.jpg');
      expect(dto.downloadUrl, 'https://example.com/download.pdf');
      expect(dto.genero, 'Fantasia');
    });

    test('deve converter FavoritDto para JSON corretamente', () {
      final dto = FavoritDto(
        id: 1,
        title: 'O Senhor dos Anéis',
        author: 'J.R.R. Tolkien',
        coverUrl: 'https://example.com/capa.jpg',
        downloadUrl: 'https://example.com/download.pdf',
        genero: 'Fantasia',
      );

      final json = dto.toJson();

      expect(json['id'], 1);
      expect(json['title'], 'O Senhor dos Anéis');
      expect(json['author'], 'J.R.R. Tolkien');
      expect(json['coverUrl'], 'https://example.com/capa.jpg');
      expect(json['downloadUrl'], 'https://example.com/download.pdf');
      expect(json['genero'], 'Fantasia');
    });

    test('fromJson e toJson devem ser inversos entre si', () {
      final originalJson = {
        'id': 2,
        'title': '1984',
        'author': 'George Orwell',
        'coverUrl': 'https://example.com/1984.jpg',
        'downloadUrl': 'https://example.com/1984.pdf',
        'genero': 'Distopia',
      };

      final dto = FavoritDto.fromJson(originalJson);
      final resultJson = dto.toJson();

      expect(resultJson, originalJson);
    });
  });
}
