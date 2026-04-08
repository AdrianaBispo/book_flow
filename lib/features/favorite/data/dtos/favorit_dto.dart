import 'package:myapp/features/favorite/domain/domain.dart';

class FavoritDto extends FavoritEntity {
  FavoritDto({
    required super.id,
    required super.title,
    required super.author,
    super.coverUrl,
    super.downloadUrl,
    super.genero,
  });

  factory FavoritDto.fromJson(Map<String, dynamic> json) {
    return FavoritDto(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      coverUrl: json['coverUrl'] as String?,
      downloadUrl: json['downloadUrl'] as String?,
      genero: json['genero'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
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
