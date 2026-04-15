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
    int _parseId(dynamic value) {
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      if (value is double) return value.toInt();
      return 0;
    }

    return ResultSearchDto(
      id: _parseId(json['ebo_id'] ?? json['id']),
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      coverUrl: json['cover_url'] ?? '',
      downloadUrl: json['download_url'] ?? '',
      genero: json['genero'] ?? '',
      description: json['description'] ?? '',
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
