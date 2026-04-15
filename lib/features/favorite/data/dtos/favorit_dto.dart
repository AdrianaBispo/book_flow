import 'package:myapp/features/favorite/domain/domain.dart';

class FavoritDto extends FavoritEntity {
  FavoritDto({
    required super.id,
    required super.bookId,
    required super.title,
    required super.author,
    super.coverUrl,
    super.downloadUrl,
    super.genero,
  });

  factory FavoritDto.fromJson(Map<String, dynamic> json) {
    int _parseId(dynamic value) {
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      if (value is double) return value.toInt();
      return 0;
    }

    return FavoritDto(
      id: _parseId(json['fav_id']),
      bookId: _parseId(json['ebo_id']),
      title: json['title'] as String? ?? '',
      author: json['author'] as String? ?? '',
      coverUrl: json['cover_url'] as String?,
      downloadUrl: json['download_url'] as String?,
      genero: json['genero'] as String? ?? '',
    );
  }

  factory FavoritDto.fromEntity(FavoritEntity entity) {
    return FavoritDto(
      id: entity.id,
      bookId: entity.bookId,
      title: entity.title,
      author: entity.author,
      coverUrl: entity.coverUrl,
      downloadUrl: entity.downloadUrl,
      genero: entity.genero,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fav_id': id,
      'title': title,
      'author': author,
      'cover_url': coverUrl,
      'download_url': downloadUrl,
      'genero': genero,
    };
  }
}
