import 'package:myapp/modules/favoritos/domain/domain.dart';

class FavoritoDto implements FavoritoEntity {
  final int id;
  final String title;
  final String author;
  final String? coverUrl;
  final String? downloadUrl;
  final String? genero;

  FavoritoDto({
    required this.id,
    required this.author,
    required this.title,
    this.coverUrl,
    this.downloadUrl,
    this.genero,
  }) : super();

  factory FavoritoDto.fromJson(Map<String, dynamic> json) {
    return FavoritoDto(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      coverUrl: json['coverUrl'] as String?,
      downloadUrl: json['downloadUrl'] as String?,
      genero: json['genero'] as String?,
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'coverUrl': coverUrl,
      'downloadUrl': downloadUrl,
      'genero': genero,
    };
  }

}


