import '../../domain/domain.dart';

class ResultSearchDto extends ResultSearchEntity {
  ResultSearchDto({
    required super.id,
    required super.author,
    required super.title,
    super.coverUrl,
    super.downloadUrl,
  });

  factory ResultSearchDto.fromJson(Map<String, dynamic> json) {
    return ResultSearchDto(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      coverUrl: json['cover_url'] ?? '',
      downloadUrl: json['download_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'cover_url': coverUrl,
      'download_url': downloadUrl,
    };
  }
}
