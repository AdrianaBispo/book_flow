import 'package:myapp/modules/home/domain/domain.dart';

class EbookDto extends EbookEntity {
  final int id;
  final String title;
  final String author;
  final String? coverImageUrl;
  final String? description;

  EbookDto({
    required this.id,
    required this.title,
    required this.author,
    required this.coverImageUrl,
    required this.description,
  }) : super(
         id: id,
         title: title,
         author: author,
         coverImageUrl: coverImageUrl,
         description: description,
       );

  EbookDto.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      title = map['title'],
      author = map['author'],
      coverImageUrl = map['cover_image_url'],
      description = map['description'],
      super(
        id: map['id'],
        title: map['title'],
        author: map['author'],
        coverImageUrl: map['cover_image_url'],
        description: map['description'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'cover_image_url': coverImageUrl,
      'description': description,
    };
  }
}
