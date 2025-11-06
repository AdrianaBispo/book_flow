import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/modules/favoritos/data/dtos/dtos.dart';

void main() {
  group('FavoritoDto', () {
    test('deve criar FavoritoDto a partir de JSON corretamente', () {
      final json = {
        'id': 1,
        'title': 'O Senhor dos Anéis',
        'author': 'J.R.R. Tolkien',
        'coverUrl': 'https://example.com/capa.jpg',
        'downloadUrl': 'https://example.com/download.pdf',
        'genero': 'Fantasia',
      };

      final dto = FavoritoDto.fromJson(json);

      expect(dto.id, 1);
      expect(dto.title, 'O Senhor dos Anéis');
      expect(dto.author, 'J.R.R. Tolkien');
      expect(dto.coverUrl, 'https://example.com/capa.jpg');
      expect(dto.downloadUrl, 'https://example.com/download.pdf');
      expect(dto.genero, 'Fantasia');
    });

    test('deve converter FavoritoDto para JSON corretamente', () {
      final dto = FavoritoDto(
        id: 1,
        title: 'O Senhor dos Anéis',
        author: 'J.R.R. Tolkien',
        coverUrl: 'https://example.com/capa.jpg',
        downloadUrl: 'https://example.com/download.pdf',
        genero: 'Fantasia',
      );

      final json = dto.tojson();

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

      final dto = FavoritoDto.fromJson(originalJson);
      final resultJson = dto.tojson();

      expect(resultJson, originalJson);
    });
  });
}
