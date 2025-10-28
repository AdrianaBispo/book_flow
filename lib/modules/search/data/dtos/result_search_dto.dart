import '../../domain/domain.dart';

class ResultSearchDto extends ResultSearchEntity {
  ResultSearchDto({
    required super.id,
    required super.author,
    required super.title,
    super.cover_url,
    super.download_url,
  });

  factory ResultSearchDto.fromJson(Map<String, dynamic> json) {
    return ResultSearchDto(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      cover_url: json['cover_url'],
      download_url: json['download_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'cover_url': cover_url,
      'download_url': download_url,
    };
  }

  factory ResultSearchDto.fromEntity(ResultSearchEntity entity) {
    return ResultSearchDto(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      cover_url: entity.cover_url,
      download_url: entity.download_url,
    );
  }
}
