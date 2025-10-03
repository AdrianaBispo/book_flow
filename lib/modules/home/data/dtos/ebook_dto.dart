import 'package:myapp/modules/home/domain/domain.dart';

class EbookDto extends EbookEntity {
  final int idEbook;
  final String titleEbook;
  final String authorEbook;
  final String? coverImageUrlEbook;
  final String? descriptionEbook;

  EbookDto({
    required this.idEbook,
    required this.titleEbook,
    required this.authorEbook,
    required this.coverImageUrlEbook,
    required this.descriptionEbook,
  }) : super(
         id: idEbook,
         title: titleEbook,
         author: authorEbook,
         coverImageUrl: coverImageUrlEbook,
         description: descriptionEbook,
       );

  EbookDto.fromMap(Map<String, dynamic> map)
    : idEbook = map['id'],
      titleEbook = map['title'],
      authorEbook = map['author'],
      coverImageUrlEbook = map['cover_image_url'],
      descriptionEbook = map['description'],
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
