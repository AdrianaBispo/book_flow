import '../../domain/domain.dart';

class ResultSearchDto extends ResultSearchEntity {
  ResultSearchDto({
    required super.id,
    required super.author,
    required super.title,
    super.coverUrl,
    super.downloadUrl,
    super.genero,
    super.description,
  });

  factory ResultSearchDto.fromJson(Map<String, dynamic> json) {
    return ResultSearchDto(
      id: json['id'] as int? ?? 0,
      author: json['author'] as String? ?? '',
      title: json['title'] as String? ?? '',
      coverUrl: json['cover_url'] as String? ?? '',
      downloadUrl: json['download_url'] as String? ?? '',
      genero: json['genero'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'cover_url': coverUrl,
      'download_url': downloadUrl,
      'genero': genero,
      'description': description,
    };
  }
}
